Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED2D9E77188
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Dec 2024 12:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gc2WCxVDa+xL90LnfPEoTmxwnPsFBGQJFu6/HAU7lKY=; b=2LD/7S04eIhZbfpVSJG1siv9E+
	mFTMTgYAG/j+Ame5Iswe7z85oEHWAW9cbavb6zyTQTlSChQ0bBGk9pcVLMTF3zw1Q4JWSo79Qflrk
	w3fg7UatrFqvv0P5CGpVTwvKQr6N8bxgIm1L03kh0PTmNZQbMyXjobgJd+xBd9j90idQpz8BXA/C2
	S+sjWQjK8tNeU5YIKrg1tPKOKfotMTezd3/7dA0sP323ki43zMiRviYVbAT1tITMLkbzwuXm6XztL
	ZtzE9WLAjer1IY2/gH3ytdLvCe6cS5kK0e9ymC1EHVtj1WlnFSRp0fdk9nxzTgsNLX0TijXOmupcS
	T9QD4SHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ4CI-0000000ByN8-02ww;
	Tue, 24 Dec 2024 12:39:38 +0000
Received: from pv50p00im-ztdg10021201.me.com ([17.58.6.45])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ49y-0000000By22-00mS
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Dec 2024 12:37:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; t=1735043825;
	bh=Gc2WCxVDa+xL90LnfPEoTmxwnPsFBGQJFu6/HAU7lKY=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:
	 x-icloud-hme;
	b=NFw8nGV4mMSulnri61yzK+qJGcy9/Ch+dsuJHrKfVwVsiimtCnAG3h8rFHRxp+Uyz
	 upQRA6wkcAq6UoCdHY35JVRQ8fAMwi0fFRWx45ifLIDKIpYYNfnCXbGxhfEOaQYXsR
	 1vp17v6CL5aedV5Ya9jk+HyrT7k0UWB64khbCMphdv/pxVqrNG01HpV70G71hkXLci
	 t2DsBn5eAui7bmqHM/lylU/XqVzY8Fkjio57aPrnWpZ6YDIPQmlxL9eysloKkBj+Wn
	 CHNdKt4EUe+nfzoaAy+0w9w20JbbblWFRe+AQzyMxBHNEYMWVIIso0RplKSOHi0f8w
	 fzQi63k6MyURg==
Received: from [192.168.1.25] (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-ztdg10021201.me.com (Postfix) with ESMTPSA id 14C393118B4A;
	Tue, 24 Dec 2024 12:36:26 +0000 (UTC)
Message-ID: <b69310bb-0e95-4706-a43d-569e4a1b104e@icloud.com>
Date: Tue, 24 Dec 2024 20:36:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/11] bus: fsl-mc: Constify fsl_mc_device_match()
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
 linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-sound@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-block@vger.kernel.org, linux-cxl@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net, arm-scmi@vger.kernel.org,
 linux-efi@vger.kernel.org, linux-gpio@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-hwmon@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-serial@vger.kernel.org, netdev@vger.kernel.org,
 Zijun Hu <quic_zijuhu@quicinc.com>
References: <20241211-const_dfc_done-v4-0-583cc60329df@quicinc.com>
 <20241211-const_dfc_done-v4-3-583cc60329df@quicinc.com>
 <20241223202635.00005a0a@huawei.com>
Content-Language: en-US
From: Zijun Hu <zijun_hu@icloud.com>
In-Reply-To: <20241223202635.00005a0a@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_043714_057301_367D0AEF 
X-CRM114-Status: UNSURE (   9.58  )
X-CRM114-Notice: Please train this message.
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2024/12/24 04:26, Jonathan Cameron wrote:
> On Wed, 11 Dec 2024 08:08:05 +0800
> Zijun Hu <zijun_hu@icloud.com> wrote:
> 
>> From: Zijun Hu <quic_zijuhu@quicinc.com>
>>
>> fsl_mc_device_match() does not modify caller's inputs.
>>
>> Constify it by simply changing its parameter types to const pointer.
>>
>> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
> Similar to previous patch, I'd say why you are making this change.
> There are may places in the kernel where pointers are constant but
> not marked so. Why does this one matter?  
> 

thank you for code review.
make sense.
will correct comment message for this and previous patch in v5.

> With that info added
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>


