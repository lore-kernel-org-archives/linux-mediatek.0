Return-Path: <SRS0=jGCy=DP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DC57C433E7
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2020 16:13:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F7AE21D7D
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2020 16:13:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dEPE/+G+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="bU5VmWYh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F7AE21D7D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xs4all.nl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IUJNjQWq1A+SonX3E32ESbs9FUZV5iC4bERkSMIA2RQ=; b=dEPE/+G+vRipi7YQ+fRV7l7X9
	O72IDEXPDzZLbtq+vGIjcWLkb/MW4Dii1R8LKEiZSdJ0NR3j+MMvCDG0/CqRa69mTBTbnZl4jnu0V
	6XxulPHhZbEbkB3j+wJ6Pj0dpWXKPXTelKCuzXOmwvG/Im4nLiCnUvUTwkLwgLTPaNaR8mHUFATxi
	rygFxkBqLsPWz4Vp1Bsdq3RutBBXPLLDhfLFTI4ZShU2fURMAQXyI6vgMXoYUmq8BIf4ZV1ao+oYf
	0foWg0G+M2stcfdFtDK+AI0USC+gfAxlY9LivbFGDZEJ9YLZ7NEx64PaK/+Jy3r1ANw4B2sqBWOy/
	sml9ZmgUg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQYXr-000170-1I; Thu, 08 Oct 2020 16:13:31 +0000
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQYXo-00014v-2v
 for linux-mediatek@lists.infradead.org; Thu, 08 Oct 2020 16:13:30 +0000
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud9.xs4all.net with ESMTPA
 id QYXbkXXdw4gEjQYXfk7Lq8; Thu, 08 Oct 2020 18:13:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
 t=1602173599; bh=a/fzkl1Em2rMKkC68ZYHexDtBGbDFFvQNltWRY8waX0=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=bU5VmWYhHL4PSIGmqqs0hwnfR+METy9ap2qbOOWsMqCI7PBwW4DZONKcpzg1L6Rlx
 hhr5EKy49Mlgcn4LZ75ZXigbKa61KqE/gWSS9cKwmRZTqdtc6y+dlovJHSYk4J1PJT
 I6h/9gqfUI51Uv4S4zTtbq+a/TS0vqbDBMf7voqTSbUVgbI8i8xk/o9GocWm3Pp98f
 s0HKyE5+ENRUbPBnd75tPOr8Zd93m/7/p2c4B0itI3ctu2+92x4b4bo7L8WAd1ygj+
 zzHxeAh/UYDyKNrH094NTNIh33IefIrsTDKJiuOfEV0ptZ4aLymZprr+/j2q6OnZba
 FcGoB5G4tQtiQ==
Subject: Re: [PATCH v2] media: mtk-vcodec: fix builds when remoteproc is
 disabled
To: Alexandre Courbot <acourbot@chromium.org>
References: <20201004122234.802044-1-acourbot@chromium.org>
 <c3e1c20a-7729-9f48-ce66-41e67f195fc7@xs4all.nl>
 <cda40a8e-4dd2-5fd7-c5ff-8b048475164b@xs4all.nl>
 <CAPBb6MX8rFZU=9Pd5o0mqQ6pf+1oQYzk=D0WiR93_S3FUG7jJw@mail.gmail.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <1bb71c21-0f03-5d8f-be2c-fdcb13dadcd6@xs4all.nl>
Date: Thu, 8 Oct 2020 18:13:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAPBb6MX8rFZU=9Pd5o0mqQ6pf+1oQYzk=D0WiR93_S3FUG7jJw@mail.gmail.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfNJuX+ervZ+LktO6bk5zejJpaK9Qquwwb9WreR4+7gljJpWsuSP478RbXSzBHjKIkiR8RR+5Q9sbcTwx8Q6mW9JPtOx8XJJcd40h8Elx4yfgvgCfQfO+
 mKFfoZKkLLjhVnlfhIaW3yP7Z/5ZYiBkKBPsiNxoDZ20OcE0OgJ5ybeklNlEM3yyFBy2QvmJT6jwMkO1jkFkwjpiq79W/mwbdAgMPjHIT7BLpO4zun1QDD1E
 GWxYy5oDIBXqpduZwsu39ubEPDV7BjgSC/TIqWL3IcYdGeqL0tJSHDVEucLJXVcPLAEA8JVoeFW6PdeyndXN2RPqmEJg8KYvnHOBPo38qdxIGdcLkiblqDIn
 NoDzqNEv3wewwzHJk8S+JZ1cMPmlpkHBm9LO05PieEYFy211LZhBZ2qKMpEzS4JKgSdFPaJgS9w5fuTpGLqKSWtKattFFCEDVHSpWGTOfrXJlGNH0CFfX5Ki
 t/70NzgLs//0WqxuKPzZ45z+ZrTUs1bap5w7hw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201008_121328_365597_F839AB1A 
X-CRM114-Status: GOOD (  21.48  )
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Randy Dunlap <rdunlap@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 Tomasz Figa <tfiga@chromium.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 08/10/2020 16:02, Alexandre Courbot wrote:
> Hi Hans, thanks for taking the time to look at this!
> 
> On Thu, Oct 8, 2020 at 10:12 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>
>> On 08/10/2020 15:07, Hans Verkuil wrote:
>>> Hi Alexandre,
>>>
>>> On 04/10/2020 14:22, Alexandre Courbot wrote:
>>>> The addition of MT8183 support added a dependency on the SCP remoteproc
>>>> module. However the initial patch used the "select" Kconfig directive,
>>>> which may result in the SCP module to not be compiled if remoteproc was
>>>> disabled. In such a case, mtk-vcodec would try to link against
>>>> non-existent SCP symbols. "select" was clearly misused here as explained
>>>> in kconfig-language.txt.
>>>>
>>>> Replace this by a "depends" directive on at least one of the VPU and
>>>> SCP modules, to allow the driver to be compiled as long as one of these
>>>> is enabled, and adapt the code to support this new scenario.
>>>>
>>>> Also adapt the Kconfig text to explain the extra requirements for MT8173
>>>> and MT8183.
>>>>
>>>> Reported-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>>> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
>>>> Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
>>>> ---
>>>>  drivers/media/platform/Kconfig                | 10 +--
>>>>  .../media/platform/mtk-vcodec/mtk_vcodec_fw.c | 72 ++++++++++++-------
>>>>  2 files changed, 54 insertions(+), 28 deletions(-)
>>>>
>>>> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
>>>> index a3cb104956d5..98eb62e49ec2 100644
>>>> --- a/drivers/media/platform/Kconfig
>>>> +++ b/drivers/media/platform/Kconfig
>>>> @@ -253,14 +253,16 @@ config VIDEO_MEDIATEK_VCODEC
>>>>      depends on MTK_IOMMU || COMPILE_TEST
>>>>      depends on VIDEO_DEV && VIDEO_V4L2
>>>>      depends on ARCH_MEDIATEK || COMPILE_TEST
>>>> +    depends on VIDEO_MEDIATEK_VPU || MTK_SCP
>>>
>>> Close, but no cigar.
>>>
>>> If VIDEO_MEDIATEK_VPU=y and MTK_SCP=m, then VIDEO_MEDIATEK_VCODEC can be configured
>>> to y, and then it won't be able to find the scp_ functions.
>>>
>>> To be honest, I'm not sure how to solve this.
>>
>> Found it. Add this:
>>
>>         depends on MTK_SCP || !MTK_SCP
>>         depends on VIDEO_MEDIATEK_VPU || !VIDEO_MEDIATEK_VPU
>>
>> Ugly as hell, but it appears to be the correct incantation for this.
> 
> But doesn't it mean that the driver can be compiled if !MTK_SCP and
> !VIDEO_MEDIATEK_VPU? That's the one case we want to avoid.

No, because you still have:

	depends on VIDEO_MEDIATEK_VPU || MTK_SCP

So at least one of these must be set.

Just try it :-)

Regards,

	Hans

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
