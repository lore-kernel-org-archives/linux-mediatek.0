Return-Path: <SRS0=ZAsA=HL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FE1BC433DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Feb 2021 01:18:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E6A364EB4
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Feb 2021 01:18:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E6A364EB4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0SS/QlZnwYEeSZsgj2RmVFUV8Mso+8/EMm7tKLG7Tg4=; b=ZV/0ZE+4SyV028Z3Zsjo4mk9h
	x2qmT15gf2JZYES5LJTRVyFdE4EQYk78h4g7FmBVK6NuaPuNf9Q2rK9b1dYIIh4zZUqQisTwDRZbD
	BXIhW3Ewfu0WpqPAfK7O9vpYNUTZFAZtq4Fs9X4Ur8OIyML9joGojaBsRr8g0fTr5gYyL8gHFwDom
	jDfFC1YllBUsmDPvwbw/sb+6fw4MbuiANhs/kHypqvMzFl8ZVz5ozPoduWGrd3vS+p2pCTIUe0Zkh
	5ijXoB/th+CBAEAExIJvLFnBBsOFcSOPSYw3RUUue9sBxEMdNlhqYUhx0LKZ7uOjaSi4edhcPgOz8
	bTl3TT3Bg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9HfX-0004m8-KU; Tue, 09 Feb 2021 01:18:19 +0000
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9HfT-0004kh-FX; Tue, 09 Feb 2021 01:18:16 +0000
Received: from [10.130.0.193] (unknown [113.200.148.30])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx7_LK4iFgkGUIAA--.10747S3; 
 Tue, 09 Feb 2021 09:18:03 +0800 (CST)
Subject: Re: [PATCH] staging: fix ignoring return value warning
To: Dan Carpenter <dan.carpenter@oracle.com>, Sascha Hauer <sha@pengutronix.de>
References: <1612689808-30985-1-git-send-email-tangyouling@loongson.cn>
 <20210208134517.GG2696@kadam> <20210208150618.GI8233@pengutronix.de>
 <20210208190237.GN20820@kadam>
From: Youling Tang <tangyouling@loongson.cn>
Message-ID: <13779748-ab8e-c7c3-11e4-5232836f5ae6@loongson.cn>
Date: Tue, 9 Feb 2021 09:18:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20210208190237.GN20820@kadam>
X-CM-TRANSID: AQAAf9Dx7_LK4iFgkGUIAA--.10747S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Zw1rAr1UWF4UtrWrJw1UWrg_yoW8Ar4fpa
 y0kFyjkFZ8tF4UKan0vw40v3WYy3srK348uFnYyw18u345XFyftr4UtrW5Ww15K34SkF1Y
 yFWUXa4jqa4DZFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvIb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I
 8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
 F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
 4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487
 MxkIecxEwVAFwVWkMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I
 0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWU
 tVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcV
 CY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv
 67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf
 9x07b51v-UUUUU=
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_201816_071125_115C8D70 
X-CRM114-Status: GOOD (  16.22  )
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
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Dan


On 02/09/2021 03:02 AM, Dan Carpenter wrote:
> On Mon, Feb 08, 2021 at 04:06:18PM +0100, Sascha Hauer wrote:
>> Hi Dan,
>>
>> On Mon, Feb 08, 2021 at 04:45:17PM +0300, Dan Carpenter wrote:
>>> On Sun, Feb 07, 2021 at 05:23:28PM +0800, Youling Tang wrote:
>>>> Fix the below ignoring return value warning for device_reset.
>>>>
>>>> drivers/staging/mt7621-dma/mtk-hsdma.c:685:2: warning: ignoring return value
>>>> of function declared with 'warn_unused_result' attribute [-Wunused-result]
>>>>          device_reset(&pdev->dev);
>>>>          ^~~~~~~~~~~~ ~~~~~~~~~~
>>>> drivers/staging/ralink-gdma/ralink-gdma.c:836:2: warning: ignoring return value
>>>> of function declared with 'warn_unused_result' attribute [-Wunused-result]
>>>>          device_reset(&pdev->dev);
>>>>          ^~~~~~~~~~~~ ~~~~~~~~~~
>>>>
>>> We can't really do this sort of fix without the hardware to test it.
>>> This could be the correct fix or perhaps switching to device_reset_optional()
>>> is the correct fix.  We can't know unless we have the hardware to test.
>> When device_reset() is the wrong function then adding a return value
>> check will turn this into a runtime error for those who have the
>> hardware which will hopefully trigger them to tell us why reset_device
>> is wrong for them.
>> At least for a staging driver I find this procedure opportune.
>>
> That seems like sort of a jerk move...  What's the rush?  Someone will
> eventually be able to test this if we just wait around for a bit.
> Otherwise if no one has the hardware then eventually the driver will be
> deleted.
>
> regards,
> dan carpenter
We do not have the relevant hardware to test, this is just to solve a
compile-time warning.

Thanks,
Youling.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
