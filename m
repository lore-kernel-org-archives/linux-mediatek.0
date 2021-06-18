Return-Path: <SRS0=EvOn=LM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27CB3C48BDF
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jun 2021 16:01:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0581611CC
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jun 2021 16:01:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0581611CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nbd.name
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=6GTbhXZUsBVo4Gj+zspz/UU+kC9q1V+/SBHYvCYYDmw=; b=KfGlg1IK6iF3n16qDQT4+tpnLp
	/pY3NjZkGt4Uya0/gdRkjWmJcEPLCusK0RM3A9/XoXhXQm5K98p0ln8B4++bc0H+lXM9Msa3dQ8my
	dnlwrycFQuYALnRwWhyi56lNz9fDX184OZvlyAr5FMeK8TybcgVdkcpyvuTnysCFcnaqpMJG7R0c9
	JDmS/Lvam219SPCCD5lEwyXiigwZSXoOhMg6CIz/fYnvXnyz6Ah25icIGTLCsk0LPqAGLrF4Yrwxu
	LQO8TVYhmW5IkJ3qxqM0qLUoNvzajmNsNkJWb0AWsrADFGaI68Mfkg3DOnKCbyiGF2sJA+aSRAXYu
	tpaLBf1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luGw3-00EsWW-C0; Fri, 18 Jun 2021 16:01:35 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luGw1-00EsW1-A5
 for linux-mediatek@lists.infradead.org; Fri, 18 Jun 2021 16:01:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L5tfF3qUoHfVzNZ9MEHYgKJJQ+VE6dPfO4oGXHMtAWo=; b=F+ZKs2RnAFTU/GvH1sKRP8UqAL
 APgOHVk4xD9sB7hFA1shc4xqfiVX86gVt0ETEUvxHGQx1yANf2xFQeQcIQLQU1UG9hC3s4r1WjEZW
 cd1jwCXrEv3dPmdoVgNh3SLc0MwP89NSoBokdtieSvrRq3GuUQytvaCsthNOmHIVSXXs=;
Received: from p54ae9ff2.dip0.t-ipconnect.de ([84.174.159.242] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1luGvu-00075O-LD; Fri, 18 Jun 2021 18:01:26 +0200
Subject: Re: [PATCH] mt76: mt7921: introduce PCIe ASPM support (L0s/L1/L1ss)
To: Deren Wu <Deren.Wu@mediatek.com>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>, 
 YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>,
 Eric-SY Chang <Eric-SY.Chang@mediatek.com>, KM Lin <km.lin@mediatek.com>,
 Robin Chiu <robin.chiu@mediatek.com>, CH Yeh <ch.yeh@mediatek.com>,
 Posh Sun <posh.sun@mediatek.com>, Eric Liang <Eric.Liang@mediatek.com>,
 Stella Chang <Stella.Chang@mediatek.com>, jemele@google.com,
 yenlinlai@google.com, linux-wireless <linux-wireless@vger.kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>
References: <eb6e8c6b45f3a8a71e9cff95108aff64d560cdc0.1623465371.git.deren.wu@mediatek.com>
From: Felix Fietkau <nbd@nbd.name>
Message-ID: <44283e4b-31ed-399e-699f-c2567bf10c32@nbd.name>
Date: Fri, 18 Jun 2021 18:01:25 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <eb6e8c6b45f3a8a71e9cff95108aff64d560cdc0.1623465371.git.deren.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_090133_551874_4EE38F27 
X-CRM114-Status: UNSURE (   7.16  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On 2021-06-12 04:59, Deren Wu wrote:
> From: Deren Wu <deren.wu@mediatek.com>
> 
> for better power consumption, default enable PCIe ASPM
> 
> Tested-by: Leon Yen <Leon.Yen@mediatek.com>
> Signed-off-by: Deren Wu <deren.wu@mediatek.com>
This seems to be duplicating functionality from drivers/pci/pcie/aspm.c
I think the driver shouldn't need to touch this, maybe it is enough to
remove the mt76_pci_disable_aspm call and enable ASPM in the kernel config?

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
