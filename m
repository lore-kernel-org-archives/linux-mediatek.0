From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] soc: mediatek: pwrap: Zero initialize rdata in
 pwrap_init_cipher
Date: Fri, 12 Apr 2019 21:58:29 +0200
Message-ID: <0d77d9bd-4b4e-8e40-a721-cf8eb0451c9e@gmail.com>
References: <20190307225650.23001-1-natechancellor@gmail.com>
 <20190320191118.GE28744@archlinux-ryzen>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190320191118.GE28744@archlinux-ryzen>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com, Nick Desaulniers <ndesaulniers@google.com>
List-Id: linux-mediatek@lists.infradead.org



On 20/03/2019 20:11, Nathan Chancellor wrote:
> On Thu, Mar 07, 2019 at 03:56:51PM -0700, Nathan Chancellor wrote:
>> When building with -Wsometimes-uninitialized, Clang warns:
>>
>> drivers/soc/mediatek/mtk-pmic-wrap.c:1358:6: error: variable 'rdata' is
>> used uninitialized whenever '||' condition is true
>> [-Werror,-Wsometimes-uninitialized]
>>
>> If pwrap_write returns non-zero, pwrap_read will not be called to
>> initialize rdata, meaning that we will use some random uninitialized
>> stack value in our print statement. Zero initialize rdata in case this
>> happens.
>>
>> Link: https://github.com/ClangBuiltLinux/linux/issues/401
>> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
>> ---
>>
>> I don't know if this is better or to just restructure the if statement
>> below (I'm not an expert in this code so I'll leave that up to the
>> maintainers to decide).
>>
>>  drivers/soc/mediatek/mtk-pmic-wrap.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
>> index 8236a6c87e19..2f632e8790f7 100644
>> --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
>> +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
>> @@ -1281,7 +1281,7 @@ static bool pwrap_is_pmic_cipher_ready(struct pmic_wrapper *wrp)
>>  static int pwrap_init_cipher(struct pmic_wrapper *wrp)
>>  {
>>  	int ret;
>> -	u32 rdata;
>> +	u32 rdata = 0;
>>  
>>  	pwrap_writel(wrp, 0x1, PWRAP_CIPHER_SWRST);
>>  	pwrap_writel(wrp, 0x0, PWRAP_CIPHER_SWRST);
>> -- 
>> 2.21.0
>>
> 
> Gentle ping (if there was a response to this, I didn't receive it). I
> know I sent it in the middle of a merge window so I get if it slipped
> through the cracks.
> 

applied now to v5.1-next/soc

thanks
