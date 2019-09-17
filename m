From: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH v3] mm/kasan: dump alloc and free stack for page allocator
Date: Tue, 17 Sep 2019 10:19:15 +0200
Message-ID: <a5103bf0-245e-5894-0486-3e92fa830e41@suse.cz>
References: <20190911083921.4158-1-walter-zh.wu@mediatek.com>
 <5E358F4B-552C-4542-9655-E01C7B754F14@lca.pw>
 <c4d2518f-4813-c941-6f47-73897f420517@suse.cz>
 <1568297308.19040.5.camel@mtksdccf07>
 <613f9f23-c7f0-871f-fe13-930c35ef3105@suse.cz>
 <79fede05-735b-8477-c273-f34db93fd72b@virtuozzo.com>
 <6d58ce86-b2a4-40af-bf40-c604b457d086@suse.cz>
 <4e76e7ce-1d61-524a-622b-663c01d19707@virtuozzo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4e76e7ce-1d61-524a-622b-663c01d19707@virtuozzo.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Ryabinin <aryabinin@virtuozzo.com>, Walter Wu <walter-zh.wu@mediatek.com>
Cc: Qian Cai <cai@lca.pw>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Andrey Konovalov <andreyknvl@google.com>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

On 9/16/19 5:57 PM, Andrey Ryabinin wrote:
>> --- a/mm/page_alloc.c
>> +++ b/mm/page_alloc.c
>> @@ -710,8 +710,12 @@ static int __init early_debug_pagealloc(char *buf)
>>  	if (kstrtobool(buf, &enable))
>>  		return -EINVAL;
>>  
>> -	if (enable)
>> +	if (enable) {
>>  		static_branch_enable(&_debug_pagealloc_enabled);
>> +#ifdef CONFIG_PAGE_OWNER
>> +		page_owner_free_stack_disabled = false;
> 
> I think this won't work with CONFIG_DEBUG_PAGEALLOC_ENABLE_DEFAULT=y

Good point, thanks.

>> +#endif
>> +	}
>>  
>>  	return 0;
>>  }
>> diff --git a/mm/page_owner.c b/mm/page_owner.c
>> index dee931184788..b589bfbc4795 100644
>> --- a/mm/page_owner.c
>> +++ b/mm/page_owner.c
>> @@ -24,13 +24,15 @@ struct page_owner {
>>  	short last_migrate_reason;
>>  	gfp_t gfp_mask;
>>  	depot_stack_handle_t handle;
>> -#ifdef CONFIG_DEBUG_PAGEALLOC
>> +#ifdef CONFIG_PAGE_OWNER_FREE_STACK
>>  	depot_stack_handle_t free_handle;
>>  #endif
>>  };
>>  
>>  static bool page_owner_disabled = true;
>> +bool page_owner_free_stack_disabled = true;
>>  DEFINE_STATIC_KEY_FALSE(page_owner_inited);
>> +static DEFINE_STATIC_KEY_FALSE(page_owner_free_stack);
>>  
>>  static depot_stack_handle_t dummy_handle;
>>  static depot_stack_handle_t failure_handle;
>> @@ -46,6 +48,9 @@ static int __init early_page_owner_param(char *buf)
>>  	if (strcmp(buf, "on") == 0)
>>  		page_owner_disabled = false;
>>  
>> +	if (!page_owner_disabled && IS_ENABLED(CONFIG_KASAN))
> 
> I'd rather keep all logic in one place, i.e. "if (!page_owner_disabled && (IS_ENABLED(CONFIG_KASAN) || debug_pagealloc_enabled())"
> With this no changes in early_debug_pagealloc() required and CONFIG_DEBUG_PAGEALLOC_ENABLE_DEFAULT=y should also work correctly.

In this function it would not work if the debug_pagealloc param gets
processed later than page_owner, but should be doable in
init_page_owner(), I'll try, thanks.

> 
>> +		page_owner_free_stack_disabled = false;
>> +
>>  	return 0;
>>  }
>>  early_param("page_owner", early_page_owner_param);
>  
> 
