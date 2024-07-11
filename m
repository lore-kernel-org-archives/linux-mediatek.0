Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D74C3DA45
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jul 2024 18:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9t23BqUwT489+BhKxEd/YtWGz38FvcAET34q8jd+6aU=; b=DX0CptZ3WM5+YSbxj+XHcrsZ6h
	13Z9YmMeginSbakTokeHtk95GOf9SWm9AvWW4BNTdRvzfMomSMubRQXmOPWQpBPefZEp59+534Eoq
	iYvz3fBxa2qs4xHEvGuVvGzxW3xI/jZ0YxWhJXFKFVGgVUgpdjyUevpvvtKPTTgfktX0eqyZMIYhW
	WmGH5TaRjywQQwln1Fn5+q3A69ODsMCaRn3N2T9AdUKCs6D/ldpPX1hNWjJ+fzAHpBHoj065V/8tn
	qmoFwhxkXb3i0Js8sNwtcvP+SFkTpHadGZNHgrtI++Nl3ycBn41NSsfgRn/HAP0yFM71tHNt2m3hk
	lmj8c/cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRyDa-0000000EzuT-446L;
	Thu, 11 Jul 2024 18:08:34 +0000
Received: from mout.web.de ([212.227.15.4])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRyB5-0000000EyeY-0tO7
	for linux-mediatek@lists.infradead.org;
	Thu, 11 Jul 2024 18:06:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1720721152; x=1721325952; i=spasswolf@web.de;
	bh=9t23BqUwT489+BhKxEd/YtWGz38FvcAET34q8jd+6aU=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=FL+vMd7Qb+gNo3bykV/mgNvhzTYkya83jCONMTQBNO6ulHHktTN3uD1sWytxUK7v
	 P6F7j1w8S9FcKM8o0c9oA+ELGFEFcfM/ttbA3rTJ2bDJCZ4Jv2X1DOvnuTgUrIcjj
	 L+kdsOaIFqfbECbwLqQF1Iw9i5TrbMJsunON8TdQi60qaLDlK4RZimy9M9Uuj+7vv
	 9INDpzGfqIgG3JjZV+k7ADForrXZnmGeFDDRJQyzKcl8I8uEm5kMH1QV0zsnNmGWm
	 QmDB/Sx8F0hNleq7l0YVi4K8QG0lti1PRFTzyiK7IzAcw954asY0Nyp1GXs+JkjCo
	 esy4K5SJumPD0D/2qA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.0.101] ([84.119.92.193]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MOUxu-1sj3Us0Qf8-00LmZV; Thu, 11
 Jul 2024 20:05:52 +0200
Message-ID: <a88dbf3d811970044ae1e489f5711d40347596d6.camel@web.de>
Subject: Re: patch 46/47 causes NULL pointer deref on mt7921
From: Bert Karwatzki <spasswolf@web.de>
To: sean.wang@kernel.org
Cc: deren.wu@mediatek.com, linux-mediatek@lists.infradead.org, 
	linux-wireless@vger.kernel.org, lorenzo.bianconi@redhat.com, 
	mingyen.hsieh@mediatek.com, nbd@nbd.name, sean.wang@mediatek.com
Date: Thu, 11 Jul 2024 20:05:50 +0200
In-Reply-To: <20240711175156.4465-1-spasswolf@web.de>
References: <20240711175156.4465-1-spasswolf@web.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.52.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:fmiCmur7DOthIlGeLEcj2oMXAni9f2RVelfzIWnDiCqpnUS2nbk
 g2FyM2irqsvtiS2PN+xxXXo184ooyIZCQS9bjCYtRdYZnoRzwUMAr6A/OvHG2pVIPXolj4E
 OAhSAVFXB1vPzYNfvrYH7sau/Wspkq96ZIjWGS5tLPEOOFTX/75cBv4CznAqQjyq/QiDm/l
 6muW7ZcHEVWRI4yGEFK3g==
UI-OutboundReport: notjunk:1;M01:P0:XCwTzY2aVto=;bGRQHaF2Q61qGel0hkST9eCrCsP
 bYq/vQHFhwGzuCsDvO3qj+0sVQC7sGMzyenNdMwjd+eouJfNtSMDDjb0psUwjwn5E2D8/Zx5+
 WqkBImxAepJLZsBK024HNGqChu+yBuoX8qo5xm4qo9rSi8iVk2yDRyGyWK7YCq1mNbYHY0wkI
 sVjhhYV5BlmCr9Vo8C82Sxyvl/kCz2Fw1uzoTelrSzKNBQ1QH/HwW4XAoDenGujiCcLB/L/EC
 dAPwrTyKaIX2BSKuSjQXuh/8aahR+5QvxXbSrsqHyOY1tUyeOUmI4rEuJQhLpkO8rEb8Jd9sJ
 thRHtlV3BolpicTFKIM98ubajc+e5Hl9TCJAwxqt715LI12L309SgMXi26Xud/KYSyQsiUNkX
 0DiEC2Hj82LOtXNf1WY/sx+JDRtp8L0pbVCj5Zbci/k99cL4I3EUnXo5qwIfV2rhCmTMH5c31
 Pyu3YRnUpQ44MkbB4XpiIvJhLubcx1po0aZJCKDoqoMDaaSO+1zaHg7suXduQ09GTvWlVZaA/
 evZThSJbBrBbK4abwzZJtB7tLyJ+OFKOkK4PhbqWFQrDhcHUsXExlyvaHYxPep3LUUiAp9x10
 44I0mYgmckyeVf3YlMlrPLzn3X+vCW3NGyo2uuEqCuH98g/62XpjL0oF1fan0VepwLPkicZy/
 RDb+m5pZYKmO5EmadGeqoamvNJCDKmq51WwehHYDfB7dCyROrnT+k3WHn9ocEAUXlOM+tFmFS
 fyVWPkzMIG3lE4jfzFQC+ZJduUYlSZ09KRM44DFe/eaqy7xFgoVpE5hazU9RKCosybFRvbgLl
 bhDgdSOdvyeMNmWltPRJnIXQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_110559_622325_86EC6E1F 
X-CRM114-Status: UNSURE (   5.02  )
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

The mt7925_ops struct contains these four ieee80211_ops which
are not present in the mt7921_ops struct. In mt7925_change_vif_links
mconf->vif is set.

from drivers/net/wireless/mediatek/mt76/mt7925/main.c:
	.vif_cfg_changed = mt7925_vif_cfg_changed,
	.link_info_changed = mt7925_link_info_changed,
	.change_vif_links = mt7925_change_vif_links,
	.change_sta_links = mt7925_change_sta_links,

So I think you're probably breaking generic code (i. e. code that is also used
on mt7921) with mt7925 specific changes.

Bert Karwatzki

