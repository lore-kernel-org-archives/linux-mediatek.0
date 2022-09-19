Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB40DECAAD3
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 13:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VocfEw++MFgUsPr0v6ZBZJ3FMCFmFfXe2mplGtWPu2M=; b=lvsrVFJi89R5QFLlo6wsIJIl0y
	X3gc3Es5JtlxBSRbu+goN1DNrEBzE9IVR7fUuoGTwR3iR4zkFV6nmFpngWiWuVN62CEStALUoKYxs
	93wW+faVTiGzIfggpFAVuRwLXeoPTEZsK3ao5+f8rlIWCa3ho0xgGD6V83LIS/kr9mGB1js15ChUH
	H3JZ+dzMPlt7oyhkaivKWlPOXzcpSjW0hfl470nY0cjB5VKsK6RXGf4eaJ8crOD/nYIbIucbBfIZs
	fXQ71yfPK83+JmxMsb63ytfXUrp4qymQ2Sp9/jceF1ridZWPP7pXZ3WulBt6DAlYOBx7pH/vDvcRZ
	86cKUHMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaH3U-00Bv0y-3h; Mon, 19 Sep 2022 13:43:24 +0000
Received: from mail.base45.de ([80.241.60.77])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaH3G-00Buwa-Hw; Mon, 19 Sep 2022 13:43:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fe80.eu;
	s=20190804; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=VocfEw++MFgUsPr0v6ZBZJ3FMCFmFfXe2mplGtWPu2M=; b=OUcgTWX8iTWv1z2PC1W/G8Y0IU
	VnnVpDlIU5YvD0Wk/RI8jScos5OainyAIVDjdjbSECXSAIFn9eMUqeHIIAhNDc2INKOuy27IMii/y
	iC0EOnkKV+9CZPsNOHob5h0GbZdC7lTxZzXeJr8SGb/c23czk0bLhQ5P9njD0UHQuAeqa5RrIjcru
	lWNRMopGKRmZTxdEP91vTSeGLn9ffA88/AcbxaW/L8U5DCa9t20JrBub7vsYTPPATBF28j2Xhrpes
	c2heHaBJW3qg8eCZdbMzjJ33X3Dr+w1uMAHLQyEcRkZM2sgkdl/bua382CyRdl/L4woJeBjzMKMbJ
	rEvGPGvw==;
Received: from [92.206.252.27] (helo=javelin)
	by mail.base45.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <lynxis@fe80.eu>)
	id 1oaGuR-0018Y4-GQ; Mon, 19 Sep 2022 13:34:03 +0000
Date: Mon, 19 Sep 2022 15:34:01 +0200
From: Alexander 'lynxis' Couzens <lynxis@fe80.eu>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>, Sean Wang
 <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, Daniel Golle <daniel@makrotopia.org>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 3/5] net: mediatek: sgmii:
 mtk_pcs_setup_mode_an: don't rely on register defaults
Message-ID: <20220919153402.65baf42b@javelin>
In-Reply-To: <YyhSnqacAE4ajRdy@shell.armlinux.org.uk>
References: <20220919083713.730512-1-lynxis@fe80.eu>
	<20220919083713.730512-4-lynxis@fe80.eu>
	<YyhSnqacAE4ajRdy@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_064310_618007_2BCF91E5 
X-CRM114-Status: UNSURE (   8.46  )
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

On Mon, 19 Sep 2022 12:29:34 +0100
"Russell King (Oracle)" <linux@armlinux.org.uk> wrote:

> I'm not sure if I've asked this before, but why does SGMII_AN_RESTART
> need to be set here? It could do with a comment in the code.

It's not my bit :). I've not added it. But why not (re)start autoneg
when powering up the phy?

Should it done elsewhere?

