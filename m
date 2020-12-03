Return-Path: <SRS0=jUzJ=FH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 138B5C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 18:24:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86A1F2085B
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 18:24:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86A1F2085B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DMTHxXDrJR6IokT43sAaumL7FhJDSsLmlu+BRcWHXb0=; b=WZjd+R+dWZ9ys1eVb3qdAu9kU
	Mpi9RNjbDIsBPFuME79wSpSdQbDJ4P6VNqmPqRlqK7jpqKy2OZQxKko4aD/NI/8NtdCGMoKoV3JaH
	VT5VrFF/Dlk7cb3oyQXUWyjvZC4M/nbn2Iiuq5rZ6aY5xfkj9Di9XpGPocC2mfYmgJ/zFdrPyS6dt
	F3NARpLimkDlChYC2LtIxRf8ZypeZ7jvyb5xSW8R+z9rb56tGFazS8P+G8GMpjcXqiAgykJJw2k48
	+6KhpiUSl+/jPmxn5J89zHgiFkn1PdMTFmkk8Up6L/x+aUbxpF5eX0YaEJ6AjRcvzwv4qhoFqMvgv
	IQAPvxpmg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kktHK-00028D-Ga; Thu, 03 Dec 2020 18:24:30 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kktHI-00027H-L9; Thu, 03 Dec 2020 18:24:29 +0000
Received: from 1.general.cking.uk.vpn ([10.172.193.212])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1kktHG-0000p3-Ro; Thu, 03 Dec 2020 18:24:26 +0000
Subject: Re: media: i2c: add OV02A10 image sensor driver
To: Andy Shevchenko <andy.shevchenko@gmail.com>
References: <9af089ea-2532-68ac-5d22-97a669ccec91@canonical.com>
 <CAHp75Ve7Sdf=Zy5N1LN_w22=YwPgWWR-FZtrQcAkOF=ViT2Kbw@mail.gmail.com>
From: Colin Ian King <colin.king@canonical.com>
Message-ID: <8eb453c7-a221-e741-5fe5-655e59075f34@canonical.com>
Date: Thu, 3 Dec 2020 18:24:26 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Ve7Sdf=Zy5N1LN_w22=YwPgWWR-FZtrQcAkOF=ViT2Kbw@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_132428_829946_1B6C8E03 
X-CRM114-Status: GOOD (  20.34  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Dongchun Zhu <dongchun.zhu@mediatek.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 03/12/2020 18:10, Andy Shevchenko wrote:
> On Thu, Dec 3, 2020 at 8:03 PM Colin Ian King <colin.king@canonical.com> wrote:
> 
>> Static analysis on linux-next with Coverity has detected an issue with
>> the following commit:
> 
> If you want to fix it properly, see my comments below...
> 
>> 529 static int ov02a10_s_stream(struct v4l2_subdev *sd, int on)
>> 530 {
>> 531        struct ov02a10 *ov02a10 = to_ov02a10(sd);
>> 532        struct i2c_client *client =
>> v4l2_get_subdevdata(&ov02a10->subdev);
>>
>>    1. var_decl: Declaring variable ret without initializer.
>>
>> 533        int ret;
>> 534
>> 535        mutex_lock(&ov02a10->mutex);
>> 536
>>
>>    2. Condition ov02a10->streaming == on, taking true branch.
>>
>> 537        if (ov02a10->streaming == on)
>>
>>    3. Jumping to label unlock_and_return.
>>
>> 538                goto unlock_and_return;
>> 539
>> 540        if (on) {
>> 541                ret = pm_runtime_get_sync(&client->dev);
>> 542                if (ret < 0) {
> 
>> 543                        pm_runtime_put_noidle(&client->dev);
>> 544                        goto unlock_and_return;
> 
> Instead of two above:
>                        goto err_rpm_put;
> 
>> 545                }
>> 546
>> 547                ret = __ov02a10_start_stream(ov02a10);
>> 548                if (ret) {
>> 549                        __ov02a10_stop_stream(ov02a10);
>> 550                        ov02a10->streaming = !on;
>> 551                        goto err_rpm_put;
>> 552                }
>> 553        } else {
>> 554                __ov02a10_stop_stream(ov02a10);
>> 555                pm_runtime_put(&client->dev);
>> 556        }
>> 557
>> 558        ov02a10->streaming = on;
> 
> (1)
> 
>> 559        mutex_unlock(&ov02a10->mutex);
>> 560
>> 561        return 0;
>> 562
>> 563 err_rpm_put:
>> 564        pm_runtime_put(&client->dev);
> 
>> 565 unlock_and_return:
> 
> Should be moved to (1).
> 
>> 566        mutex_unlock(&ov02a10->mutex);
>> 567
>>
>> Uninitialized scalar variable (UNINIT)
>>     4. uninit_use: Using uninitialized value ret.
>>
>> 568        return ret;
>> 569 }
>>
>> Variable ret has not been initialized, so the error return value is a
>> garbage value. It should be initialized with some appropriate negative
>> error code, or ret could be removed and the return should return a
>> literal value of a error code.
>>
>> I was unsure what value is appropriate to fix this, so instead I'm
>> reporting this issue.
> 
Not sure I fully understand how that fixes it. Given that ret is
currently not initialized when we hit:

	 if (ov02a10->streaming == on)
		goto unlock_and_return;

either we initialize ret to 0 at the start of the function, or do:
	
	 if (ov02a10->streaming == on) {
		ret = 0;
		goto unlock_and_return;
	}

(assuming the intention is to return zero for this specific case).

Colin

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
