Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE0EC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Apr 2022 08:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tEOMub8owFtIXM8dxXDYFXAV07DTwVEjeIaC87Jq8KE=; b=HfKDp+QK4xzWeN
	Hq/gHw1XBFxZn5OQ7cY4ck2+pOEBnpIt7Uqiwz+37q95DQZlvvvHHFOcEEkxIUE4iMBPt7b8KJ7Zw
	bp7VS8qPrjEQIVeTsqN5pr/bacanEiM9A0cDk/IBrxy/hAjdSpXqsaP8mKEFy3QfFDBkh4z3ykPLp
	xz2AUD5vB2yLVNV0r8/B9ihKrxyLtDRXt4RHXhyxxl/hlysW+8HvrzGkIRyw6gfqRyfNcJIZnkpsH
	dzaNf58RD6YrDlL4TihNUCZdf8dbcTqc2AMM2r79aIelNlAmqxSzW5x2ISu9UNcQd+51DKc4V+fbr
	DGIZoP1uXlAxBZ9PwAZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfHIN-009J06-EO; Fri, 15 Apr 2022 08:27:11 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfHIL-009IxG-53
 for linux-mediatek@lists.infradead.org; Fri, 15 Apr 2022 08:27:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8DZ317B3QxIkMdTBcq04jrEIjCCQjU2WLa0i1ncE59g=; b=G8wrsIRNhK2yZuYB1c6zdhbFgR
 SybjqIRhGY1WksiS2/JOhe2gZrAUCTWv1ReVIeP7yRXimSuzIiPW+7cnbUTyM1sH3dSHaTSsSMwMD
 RXaHLUpHix2gviOsjaauNryzShVcZqIHewoGbwJMBKXJyrES1d2VfjyoZ7AE31MPFxP4=;
Received: from p57a6f1f9.dip0.t-ipconnect.de ([87.166.241.249] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1nfHIB-0002z0-6b; Fri, 15 Apr 2022 10:26:59 +0200
Message-ID: <c8662170-bf59-06df-a78c-8fb24303f274@nbd.name>
Date: Fri, 15 Apr 2022 10:26:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v2] mt76: mt7915: add debugfs knob for RF registers
 read/write
Content-Language: en-US
To: Shayne Chen <shayne.chen@mediatek.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Peter Chiu <chui-hao.chiu@mediatek.com>
References: <20220415061444.30720-1-shayne.chen@mediatek.com>
From: Felix Fietkau <nbd@nbd.name>
In-Reply-To: <20220415061444.30720-1-shayne.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_012709_481152_44C74541 
X-CRM114-Status: UNSURE (   5.14  )
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


On 15.04.22 08:14, Shayne Chen wrote:
> Add RF registers read/write support for debugging RF issues, which
> should be processed by mcu commands.
> 
> Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
> Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
> Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
What's the required width of rf_sel and rf_ofs? Would both fit together 
in a single u32? If so, you could just use the generic regidx debugfs 
file for both and simply add a rf_regval debugfs file.

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
