Return-Path: <SRS0=EyWE=O5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95C8DC433F5
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Oct 2021 10:38:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D06360F21
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Oct 2021 10:38:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4D06360F21
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=systemli.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NArtNH0QAfIjCowQeH8e0QOPqZfHvzingARtXGrm94M=; b=Oj4yhMMiP4LsDI
	/rL+e6OCLE4AXC0xoF7it9kQvxzSOPXtMOgv4xGftDrJmswrBtFjFv3s0uiz7N17BwasMSMB6CR8p
	hq5pcn79J1aNIEoJzVbEn3xXjn9Giual6dlhgSy70XM98lYezoJK7q4djJjPyK8qGobcSYjd6H0sD
	mxnkh8yaCGgjJcf2RgkdjMLVWfzxhupgLke6OWfAp0D9oPGK+Xgkz/lRyFhtaikd7+NIAkFCY87CC
	LYbC6dyOBzt6zAmo4Vu43wXshTlCJHzuIGuldc+COovvheqoI2oTEbWVx/y9pjTKdktWqw7LNt1cC
	yyerAhPCCVCr/irXqk0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZ9kB-005REx-U0; Sat, 09 Oct 2021 10:38:19 +0000
Received: from mail1.systemli.org ([2a00:c38:11e:ffff::a032])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZ9jw-005RE7-Sc; Sat, 09 Oct 2021 10:38:06 +0000
Message-ID: <274013cd-29e4-9202-423b-bd2b2222d6b8@systemli.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=systemli.org;
 s=default; t=1633775877;
 bh=FP4QHWhYPgjbDQ7Gbz/E/+mQlwH5z/kUq6BgWbS1qOg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jDPDHvGlk2IgrAgT8Y+MgQ05kEgdcU9akyg6mMQi4XUuT7HcMREUU55ygXx1BCrza
 aresiwir+C1lhaISjZiNzmTFFXI1G/6UiE+dqauZg6cLzb12+w6MoqNwwJv7+4dRZx
 IYB8+ai09l5W5P3Nl8ev3Is97kAGXSnz+FcdCErG2bzEl8cmGKppEyFL96foXIP+7q
 Ni4Lwtdyjeneewgj62n4a75OYlmOuBuHtB2haCVQYb67neUZBnZHhcjX30t29OrfE4
 4u7zNASHRNMIVUEnAm4vMmTQX8rDqizfWzG3NLkAPRvhjj1yDad1f2UqCaDc0YjHHQ
 hHmT4BkOHwsjg==
Date: Sat, 9 Oct 2021 12:37:53 +0200
MIME-Version: 1.0
Subject: Re: [RFC v2] mt76: mt7615: mt7622: fix ibss and meshpoint
Content-Language: en-US
To: Kalle Valo <kvalo@codeaurora.org>
Cc: nbd@nbd.name, lorenzo.bianconi83@gmail.com, ryder.lee@mediatek.com,
 davem@davemloft.net, kuba@kernel.org, matthias.bgg@gmail.com,
 sean.wang@mediatek.com, shayne.chen@mediatek.com,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>
References: <20211007225725.2615-1-vincent@systemli.org>
 <87czoe61kh.fsf@codeaurora.org>
From: Nick <vincent@systemli.org>
In-Reply-To: <87czoe61kh.fsf@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211009_033805_278970_E901C86D 
X-CRM114-Status: UNSURE (   9.97  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 10/9/21 10:32, Kalle Valo wrote:

> Nick Hainke <vincent@systemli.org> writes:
>
>> Fixes: d8d59f66d136 ("mt76: mt7615: support 16 interfaces").
> The fixes tag should be in the end, before Signed-off-by tags. But I can
> fix that during commit.
Thanks for feedback. Already changed that locally but I did not want to 
spam you with another RFC v3. :)
I was able to organize me a BPI-MT7615 PCIE Express Card. With and 
without this patch beacons were sent on the mt7615 pcie, so the patch 
did not make any difference. However, the mt7622 wifi will only work 
with my patch.

OpenWrt buildroot says that the chips are almost the same?

|
> |This adds support for the built-in WMAC on MT7622 SoC devices which 
> has the same feature set as a MT7615, but limited to 2.4 GHz only.||

I also did a version where I check for "is_mt7622(dev)", so it will only 
affect the internal banana pi r64 wifi. I'm happy to insert your 
feedback into my patch.

Bests
Nick


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
