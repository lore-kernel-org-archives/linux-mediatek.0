Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B628C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 13:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lT+ubPSg7Z27e2CZL1xvkfRkOOT5uelXro9M6bHbmfo=; b=UyEqfGhMdyvAQ3
	apnYjHdZlufIVgKwPWbbpqnTObGgDevS2MifqgbqpnonWika3Soi+b8Ic1TF6tq+BSHOsQD20m8ax
	4JB56415/CK7ITAuL7Dpn6MhPujyGZAJxSNbzwYQcvGpOegy/IzwHneh2FRm8SXkTChK3UIDFeFKJ
	eE+pWmqMGR0ZtUdjCIAryEtrjP1tB5w5tjHo4W8Qur50KTQUn706KVo65Uf37XIJ3rWtgZ4dlAmpn
	pC5Vy092kq4rJ2HNUrvtccZNlUNEv3H9IcBXJzI20sJRj6F31UL4mZumMksQRvdIk6CuwVsIVgN7B
	Bama93z/oHipRKx6cQQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvfca-006nrv-OY; Mon, 30 May 2022 13:39:48 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvfVV-006jrI-7F; Mon, 30 May 2022 13:32:31 +0000
Received: by mail-pg1-x534.google.com with SMTP id q123so5135434pgq.6;
        Mon, 30 May 2022 06:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Ny2lEadZmfInWcJrFzzAgVDDF4CKxiqIL5TY/BYkneo=;
        b=puMQGfHpdTRQGxm0lEpCs1RSF4C7KjYq0h+wZYKaoE8zYp/INVWuIJZVB53d2vXxdm
         yPOFwxm2g/siCvwtbYN4zJXovXiiI4+kw1biPfrGgIr5vEUISIuM1NM9JITP5Bvey3j1
         XcEjR0h9cyuuZjkpr1Api3BWl50RA07P08r8b6D2kkUBjJ5dZhJCiWiOUKK0/yiOndXv
         zj8wd23d/megGIRONLQ5Yg/y5OJQY+j6OSs3CMKP6t6kkqDB1AK9VQvlD4CaS60smslU
         gZmFXedT3r968F5LrEsqhUTLQLTaTmUP2vTUBbYQIqUEaH+TcQb2EvPoIxtCOp7okBth
         fpaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Ny2lEadZmfInWcJrFzzAgVDDF4CKxiqIL5TY/BYkneo=;
        b=G0FXv65PTw/aoSMxQ42M4n7DweC52sJ/ZXfW9FwjhSS38JB+nAmeJDoTir9Riy5w+b
         H7UZZvbvHemBaydUpye+38WgJYyjGDElUHQTUN5quZM3v8PAykFgQJZyYSX7bnsQq/7j
         XPVA8tFV8Y/BdNzvhnlPsK7lEHqgvDsptjysn4tJDDbyI0Cjr13kXnRDyUDfYlIw7+3G
         Mo4mf60VzL6Y342IlxhDr7Kj7To2xzZ9Fdzzlij9dBC49Hb6Ls98QF8YmW4AnlwnWumX
         wotuergORnEjL8yI4M7xX5pDN6tiFThsEhHXENNyHTD4XdND4/H78KJjTNqT9aoQpB0A
         /H2A==
X-Gm-Message-State: AOAM531MISgXZJvF4En6FIWbLcCAypC1zsqHMFnWtXKHR3TfmV+zo87/
	oEBFGTzNSO3JmePNdNmwtlxWYlNK8PDcpQ==
X-Google-Smtp-Source: ABdhPJzqsb+LBSAGMe1IMKY+sJJvVhMULwQHRmQXpMBhIZMarw5VKnuCKPWvETZGP6mzXj36wo843g==
X-Received: by 2002:a63:225b:0:b0:3fa:beab:211d with SMTP id t27-20020a63225b000000b003fabeab211dmr25351030pgm.350.1653917546548;
        Mon, 30 May 2022 06:32:26 -0700 (PDT)
Received: from [192.168.1.104] ([101.86.206.159])
        by smtp.gmail.com with ESMTPSA id 200-20020a6304d1000000b003f9eacd0684sm8971748pge.3.2022.05.30.06.32.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 May 2022 06:32:26 -0700 (PDT)
Message-ID: <64281aab-0301-7237-d72c-b7ab41bf50e4@gmail.com>
Date: Mon, 30 May 2022 21:32:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] mm: kmemleak: Skip check in kmemleak_*_phys when pfn
 bound is not ready
Content-Language: en-US
To: Yee Lee <yee.lee@mediatek.com>
Cc: linux-kernel@vger.kernel.org, Kuan-Ying.lee@mediatek.com,
 Andrew.Yang@mediatek.com, Sunny.Kao@mediatek.com,
 chinwen.chang@mediatek.com, Catalin Marinas <catalin.marinas@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, patrick.wang.shcn@gmail.com
References: <20220527032504.30341-1-yee.lee@mediatek.com>
 <CAGcnep9B+z8QG4f4kkW8NF+fM1Kgj=NOV=YRhLK4yK74jbqpAw@mail.gmail.com>
 <05cfaf936a0c5f37f2e7ba779a8a1b0a6252be96.camel@mediatek.com>
From: Patrick Wang <patrick.wang.shcn@gmail.com>
In-Reply-To: <05cfaf936a0c5f37f2e7ba779a8a1b0a6252be96.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_063229_403396_306C5CCD 
X-CRM114-Status: GOOD (  31.71  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 2022/5/30 10:27, Yee Lee wrote:
> On Fri, 2022-05-27 at 21:39 +0800, patrick wang wrote:
>> On Fri, May 27, 2022 at 11:25 AM <yee.lee@mediatek.com> wrote:
>>>
>>> From: Yee Lee <yee.lee@mediatek.com>
>>>
>>> In some archs (arm64), memblock allocates memory in boot time when
>>> the pfn boundary (max_pfn/min_pfn) is not ready. The lowmen checks
>>> in
>>> kmemleak_*_phys() drop those blocks and cause some false leak
>>> alarms
>>> on common kernel objects.
>>>
>>> Kmemleak output: (Qemu/arm64)
>>> unreferenced object 0xffff0000c0170a00 (size 128):
>>>    comm "swapper/0", pid 1, jiffies 4294892404 (age 126.208s)
>>>    hex dump (first 32 bytes):
>>>      62 61 73 65 00 00 00 00 00 00 00 00 00 00 00
>>> 00  base............
>>>      00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>> 00  ................
>>>    backtrace:
>>>      [<(____ptrval____)>] __kmalloc_track_caller+0x1b0/0x2e4
>>>      [<(____ptrval____)>] kstrdup_const+0x8c/0xc4
>>>      [<(____ptrval____)>] kvasprintf_const+0xbc/0xec
>>>      [<(____ptrval____)>] kobject_set_name_vargs+0x58/0xe4
>>>      [<(____ptrval____)>] kobject_add+0x84/0x100
>>>      [<(____ptrval____)>] __of_attach_node_sysfs+0x78/0xec
>>>      [<(____ptrval____)>] of_core_init+0x68/0x104
>>>      [<(____ptrval____)>] driver_init+0x28/0x48
>>>      [<(____ptrval____)>] do_basic_setup+0x14/0x28
>>>      [<(____ptrval____)>] kernel_init_freeable+0x110/0x178
>>>      [<(____ptrval____)>] kernel_init+0x20/0x1a0
>>>      [<(____ptrval____)>] ret_from_fork+0x10/0x20
>>>
>>> This patch relaxs the boundary checking in kmemleak_*_phys api
>>> if max_low_pfn is uninitialzed.
>>>
>>> Fixes: 23c2d4 (mm: kmemleak: take a full lowmem check in
>>> kmemleak_*_phy)
>>> Signed-off-by: Yee Lee <yee.lee@mediatek.com>
>>> ---
>>>   mm/kmemleak.c | 8 ++++----
>>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/mm/kmemleak.c b/mm/kmemleak.c
>>> index a182f5ddaf68..6b2af544aa0f 100644
>>> --- a/mm/kmemleak.c
>>> +++ b/mm/kmemleak.c
>>> @@ -1132,7 +1132,7 @@ EXPORT_SYMBOL(kmemleak_no_scan);
>>>   void __ref kmemleak_alloc_phys(phys_addr_t phys, size_t size, int
>>> min_count,
>>>                                 gfp_t gfp)
>>>   {
>>> -       if (PHYS_PFN(phys) >= min_low_pfn && PHYS_PFN(phys) <
>>> max_low_pfn)
>>> +       if (!max_low_pfn || (PHYS_PFN(phys) >= min_low_pfn &&
>>> PHYS_PFN(phys) < max_low_pfn))
>>
>> Just skip checking will bring the crash possibility back. Seems it's
>> beyond
>> these interfaces' handle scope for this situation, since
>> "min_low_pfn" and
>> "max_low_pfn" are depending on arches.
>>
> Yes, for the cases beyond the pfn guard, users have to take care the
> boundary by themselves.
> 

Could we record these early calling and deal with them when it's
ready? Is this appropriate?

I have an implementation based on this approach. Could you please
help to have a test on your machine as well? And someone to take
a look or review?



 From 82cae75dfaa78f414faf85bb49133e95159c041a Mon Sep 17 00:00:00 2001
From: Patrick Wang <patrick.wang.shcn@gmail.com>
Date: Mon, 30 May 2022 18:38:23 +0800
Subject: [PATCH] mm: kmemleak: record early operations and handle later

The kmemleak_*_phys() interface uses "min_low_pfn" and
"max_low_pfn" to check address. But on some architectures,
kmemleak_*_phys() is called before those two variables
initialized. Record these early operations and handle them
when kmemleak_*_phys() are ready.

Signed-off-by: Patrick Wang <patrick.wang.shcn@gmail.com>
---
  mm/kmemleak.c | 158 ++++++++++++++++++++++++++++++++++++++++++++++++++
  1 file changed, 158 insertions(+)

diff --git a/mm/kmemleak.c b/mm/kmemleak.c
index a182f5ddaf68..a71e41b49ebc 100644
--- a/mm/kmemleak.c
+++ b/mm/kmemleak.c
@@ -164,6 +164,26 @@ struct kmemleak_object {
  	char comm[TASK_COMM_LEN];	/* executable name */
  };
  
+/* maximum early recording count */
+#define EARLY_RECORDS	20
+
+/* early recording operation type */
+enum early_record_type {
+	record_alloc = 0,
+	record_free_part,
+	record_not_leak,
+	record_ignore
+};
+
+/* early recording operation */
+struct early_record_op {
+	enum early_record_type record_type;
+	phys_addr_t arg1;
+	size_t arg2;
+	int arg3;
+	gfp_t arg4;
+};
+
  /* flag representing the memory block allocation status */
  #define OBJECT_ALLOCATED	(1 << 0)
  /* flag set after the first reporting of an unreference object */
@@ -230,11 +250,26 @@ static int kmemleak_skip_disable;
  /* If there are leaks that can be reported */
  static bool kmemleak_found_leaks;
  
+/*
+ * Used to record early ops. Could recorded ops remain unhandled after
+ * initmem freed? Not likely.
+ */
+static struct early_record_op early_record_ops[EARLY_RECORDS] __initdata;
+static int early_record_op_count;
+/* indicate if recorded ops being handled */
+static bool early_record_in_handle;
+static DEFINE_RAW_SPINLOCK(early_record_lock);
+
  static bool kmemleak_verbose;
  module_param_named(verbose, kmemleak_verbose, bool, 0600);
  
  static void kmemleak_disable(void);
  
+static void record_early_ops(enum early_record_type record_type,
+			phys_addr_t arg1, size_t arg2,
+			int arg3, gfp_t arg4) __init;
+static void handle_early_ops(void) __init;
+
  /*
   * Print a warning and dump the stack trace.
   */
@@ -1132,6 +1167,26 @@ EXPORT_SYMBOL(kmemleak_no_scan);
  void __ref kmemleak_alloc_phys(phys_addr_t phys, size_t size, int min_count,
  			       gfp_t gfp)
  {
+	/* Not ready, record this operation. */
+	if (!max_low_pfn && !early_record_in_handle) {
+		/*
+		 * record_early_ops is in __init section, make sure
+		 * text executable.
+		 */
+		if (core_kernel_text((unsigned long)record_early_ops))
+			record_early_ops(record_alloc, phys, size, min_count, gfp);
+		return;
+	}
+	/* Ready, handle recorded ops if they exit and not being handled. */
+	else if (early_record_op_count && !early_record_in_handle) {
+		/*
+		 * handle_early_ops is in __init section, make sure
+		 * text executable.
+		 */
+		if (core_kernel_text((unsigned long)handle_early_ops))
+			handle_early_ops();
+	}
+
  	if (PHYS_PFN(phys) >= min_low_pfn && PHYS_PFN(phys) < max_low_pfn)
  		kmemleak_alloc(__va(phys), size, min_count, gfp);
  }
@@ -1146,6 +1201,18 @@ EXPORT_SYMBOL(kmemleak_alloc_phys);
   */
  void __ref kmemleak_free_part_phys(phys_addr_t phys, size_t size)
  {
+	/* Not ready, record this operation. */
+	if (!max_low_pfn && !early_record_in_handle) {
+		if (core_kernel_text((unsigned long)record_early_ops))
+			record_early_ops(record_free_part, phys, size, 0, 0);
+		return;
+	}
+	/* Ready, handle recorded ops if they exit and not being handled. */
+	else if (early_record_op_count && !early_record_in_handle) {
+		if (core_kernel_text((unsigned long)handle_early_ops))
+			handle_early_ops();
+	}
+
  	if (PHYS_PFN(phys) >= min_low_pfn && PHYS_PFN(phys) < max_low_pfn)
  		kmemleak_free_part(__va(phys), size);
  }
@@ -1158,6 +1225,18 @@ EXPORT_SYMBOL(kmemleak_free_part_phys);
   */
  void __ref kmemleak_not_leak_phys(phys_addr_t phys)
  {
+	/* Not ready, record this operation. */
+	if (!max_low_pfn && !early_record_in_handle) {
+		if (core_kernel_text((unsigned long)record_early_ops))
+			record_early_ops(record_not_leak, phys, 0, 0, 0);
+		return;
+	}
+	/* Ready, handle recorded ops if they exit and not being handled. */
+	else if (early_record_op_count && !early_record_in_handle) {
+		if (core_kernel_text((unsigned long)handle_early_ops))
+			handle_early_ops();
+	}
+
  	if (PHYS_PFN(phys) >= min_low_pfn && PHYS_PFN(phys) < max_low_pfn)
  		kmemleak_not_leak(__va(phys));
  }
@@ -1170,11 +1249,90 @@ EXPORT_SYMBOL(kmemleak_not_leak_phys);
   */
  void __ref kmemleak_ignore_phys(phys_addr_t phys)
  {
+	/* Not ready, record this operation. */
+	if (!max_low_pfn && !early_record_in_handle) {
+		if (core_kernel_text((unsigned long)record_early_ops))
+			record_early_ops(record_ignore, phys, 0, 0, 0);
+		return;
+	}
+	/* Ready, handle recorded ops if they exit and not being handled. */
+	else if (early_record_op_count && !early_record_in_handle) {
+		if (core_kernel_text((unsigned long)handle_early_ops))
+			handle_early_ops();
+	}
+
  	if (PHYS_PFN(phys) >= min_low_pfn && PHYS_PFN(phys) < max_low_pfn)
  		kmemleak_ignore(__va(phys));
  }
  EXPORT_SYMBOL(kmemleak_ignore_phys);
  
+/*
+ * Record early operation to early_record_ops array.
+ */
+static void __init record_early_ops(enum early_record_type record_type,
+			phys_addr_t arg1, size_t arg2,
+			int arg3, gfp_t arg4)
+{
+	struct early_record_op *op;
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&early_record_lock, flags);
+	/* early_record_ops array full */
+	if (early_record_op_count >= EARLY_RECORDS)
+		goto out;
+
+	op = &early_record_ops[early_record_op_count];
+	op->record_type = record_type;
+	op->arg1 = arg1;
+	op->arg2 = arg2;
+	op->arg3 = arg3;
+	op->arg4 = arg4;
+
+	early_record_op_count++;
+out:
+	raw_spin_unlock_irqrestore(&early_record_lock, flags);
+}
+
+/*
+ * Handle the whole recorded operations.
+ */
+static void __init handle_early_ops(void)
+{
+	struct early_record_op *op = early_record_ops;
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&early_record_lock, flags);
+	/* Indicate operations are being handled. */
+	early_record_in_handle = true;
+
+	while (early_record_op_count) {
+		/* Deal with operations according to their type. */
+		switch (op->record_type) {
+		case record_alloc:
+			kmemleak_alloc_phys(op->arg1, op->arg2,
+					op->arg3, op->arg4);
+			break;
+		case record_free_part:
+			kmemleak_free_part_phys(op->arg1, op->arg2);
+			break;
+		case record_not_leak:
+			kmemleak_not_leak_phys(op->arg1);
+			break;
+		case record_ignore:
+			kmemleak_ignore_phys(op->arg1);
+			break;
+		default:
+			break;
+		}
+
+		early_record_op_count--;
+		op++;
+	}
+
+	early_record_in_handle = false;
+	raw_spin_unlock_irqrestore(&early_record_lock, flags);
+}
+
  /*
   * Update an object's checksum and return true if it was modified.
   */
-- 
2.25.1


Thanks,
Patrick

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
