Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9166C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jun 2022 06:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Vbr1IizLjGBfCvgVxn4BEuY/FG2a3VyHf8358F7CHaE=; b=n0NYwEkDbaYl5hc42kOQat/CsP
	K3IuGjcL0rwvcrmqBe2+oZMHDobzAgwvhjlGdha/j34aUfL3JmmFdm7Z03a8unEYBDWZy1TW7Hyoi
	C++2KsWTf4SurxHqiUsHHfG8wvFVr1Ex5p9swP4MYDcWEYLXev5LVsOV/k4TcmwY3pgWhlLFLmxm6
	olGfIo7rc//cndyBhNfhvHt0KR2oBwjjIqF0Jy/thJXz6RHsScrnmeozyrtE4aT15PcfjyNvvnqar
	lenzIHvgSwNA3gfFIwmrGgxtq08V9iCOVdRVVPTlwX053fSx1QJJuPwjMT6cgdZaRfgEuz37oO2kL
	cpky/c7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o10D7-007JuU-Ag; Tue, 14 Jun 2022 06:39:33 +0000
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o10D3-007Jqv-QB
	for linux-mediatek@lists.infradead.org; Tue, 14 Jun 2022 06:39:31 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id AF7045C006E;
	Tue, 14 Jun 2022 02:39:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Tue, 14 Jun 2022 02:39:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1655188762; x=
	1655275162; bh=YLErNvqZx1IawB0vUHwDOxvcYy8H5o0KiKQdt10QrzY=; b=U
	+UE/qlH2+74a1pdC++OqXtWIXXd/Vn6hgnkHOon4r+GApTLm1chn1Eni8QBPivqK
	1DmND3dY5Lf5l0GtWXgt7QPm0AjuZhExJ0tyQKw6z8CMimhdS0+wNoYmgHvQTQdK
	6BPZqxIr6RPnP/k6ILVSmKysxP9HS+LmzJiev4FiOjlzuKXI4lHk0X+5AY4Kc/ek
	j04+YuxYNLOr/nbKaAhNS2J4AP2gM+iBn9DZLrnO/OsbkpiFu9ll11FUiYaKBtWb
	HivOcOKV/KMN48CZcaWT1iu9FxgbHPBE42z7s/0JR1XrGveuacyt7Vr8ubL/7DUu
	cgIttNkhTCs0Kk0zW1TVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1655188762; x=
	1655275162; bh=YLErNvqZx1IawB0vUHwDOxvcYy8H5o0KiKQdt10QrzY=; b=T
	F8hdFjasH8OZY7roQVqWv0Qu+ZYPa18MW26BlKNU9wKY5xC5zqLPIFKkzVO/ar8m
	dYHKe1jQY8qemfN7llew7vSEclxPNrk+rofePAwvISrHImsYBukiOzcxZV78H95Q
	78GK5cMHid6DhEdQ1xIwewusmUU04cZCaNEOoln1OA/8Ql5/yVKm8r2ribVYxfyN
	cS3FEH/4+MyDQsrq9hNfbW86pJg1ZlHa1bvrYkjvAL68tcaXqV32DrxGnm0c0K5t
	WEhthjanMBkjvE7IqTS1W5VezJ/o6VB0pcJdrE3r/8+w1s3qags4uZdJfgy1XB0b
	xyrJBkfVXl5/d0IpAi7ZA==
X-ME-Sender: <xms:Gi2oYnHgdP4g0INELdKQolrmQ7gncQUll3xIh5DO1oB1NVD7CPKCTQ>
    <xme:Gi2oYkUyi4d8wQArFGKLBpWpTW6DO6KfJegGUOLHQ-g2II_AwJlTbZG46fKCQ5S4X
    Ib0Yz8GiCAuYN10pw>
X-ME-Received: <xmr:Gi2oYpK9auqTk03rBrrS6TiPEsI7xv4_NogLK9VN90yHk_nevMwj9zaotIEuqN418N3IyoQqZIWLfq-muciFKWKEgtqBAukgqe7ojW0seZUGF8hMyashPMTyRA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddukedguddtkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefuvfevfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomhepufgr
    mhhuvghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqne
    cuggftrfgrthhtvghrnhepffdtveekvdegkeeuueetgfetffeileevudekuefhheelvdfh
    iedtheduhfduhefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:Gi2oYlFPP1lcV22QarSqf1uxSt0P4_OvAWNOBD4Y6BXqxT-9OAONlg>
    <xmx:Gi2oYtVPJ3pzCjVz7dUV-rNHoTbDRRgUCFdiTWXsLHroVPDi8BCpWA>
    <xmx:Gi2oYgP4uCMNpZO6zr3l9N94LkmiSqhnDmEmEoNTHJ8E3xhbOFRrpw>
    <xmx:Gi2oYlTmepW70fHSh9e8Uub9_Ckgpu5sZHiq_24x5-SXojU1XJuFFw>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Jun 2022 02:39:21 -0400 (EDT)
Subject: Re: [PATCH 1/2] ASoC: sun8i-codec: Partial revert to fix clock
 specifiers
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: matthias.bgg@gmail.com, wens@csie.org, jernej.skrabec@gmail.com,
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
 lgirdwood@gmail.com, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
References: <20220613161552.481337-1-ckeepax@opensource.cirrus.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <9e105410-94d5-1801-8919-af8c0cef4de1@sholland.org>
Date: Tue, 14 Jun 2022 01:39:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20220613161552.481337-1-ckeepax@opensource.cirrus.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_233930_418582_0E2F3A52 
X-CRM114-Status: GOOD (  10.28  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Charles,

On 6/13/22 11:15 AM, Charles Keepax wrote:
> Recent updates accidentally updated the clock producer/consumer
> specifiers on this device as part of refactoring the CPU side of the DAI
> links. However, this device sits on the CODEC side and shouldn't have
> been updated. Partially revert the changes keeping the switch to the new
> clock terminology but going back to the CODEC defines.
> 
> Fixes: 7cc3965fde74 ("ASoC: sunxi: Update to use set_fmt_new callback")
> Reported-by: Samuel Holland <samuel@sholland.org>
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Reviewed-by: Samuel Holland <samuel@sholland.org>
Tested-by: Samuel Holland <samuel@sholland.org>

Thanks for the quick follow-up, and sorry for the confusion my earlier comment
caused. I verified that sound is broken (loud static) on a Pine A64-LTS board
with for-next, and is fixed by this patch.

Regards,
Samuel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
