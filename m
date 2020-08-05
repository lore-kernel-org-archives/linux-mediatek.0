Return-Path: <SRS0=PAw8=BP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A182C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Aug 2020 09:19:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AD3C22CA1
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Aug 2020 09:19:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Vce4AALM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="uMogUJIQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="SIpw4/hq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4AD3C22CA1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:To:From:
	Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/WXQX337Hcur42A1XQ77XApxD5kRcVfHMdNFL+LWM+k=; b=Vce4AALMVBvNQowiPKZQQ8J6k
	B60N+1vO/dhl80kzf7BD0DKtOMBNyRTEUYr+TkZwzuWd3EUCHE+rvseWG+hugAPGhoExLGeGynPVk
	ub2frU5G9Cs0P5ytxAkh65vB0VGNsyBry8pbsQyMVy+/nDGA3XGDA9yjqX8pB5vgstwcU+/OPafJE
	MQGM5veF9BV+038LlcGJ0QbdLifz1ekvC/iLdTxWP8gxDY13ypUmF7ahgT/LsC2l7seeY5E2MogxD
	9XcA5qCThFDEHQeyuckvYj/7Vz3gUNHiGdb0r1TMFD7KURfbs4Tedud1EV9hTS6uhmKzwyREpeRQy
	7pZUTm35w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3Fa2-0007oD-S0; Wed, 05 Aug 2020 09:19:27 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3Fa1-0007nf-IK; Wed, 05 Aug 2020 09:19:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:References:
 In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=KouBFqPcVdY/N2jpqO+a5lVPiMqUcEXz0mYKHefvmGY=; b=uMogUJIQzeUJU8NGqMi+aNZTiZ
 mdoJnRKsd6XHRIg9QNrEfPZI+CexS0VDEsu++SrtDO7IQdZlXiaRTVTV+sCw8FQE+L49XTzuHmWR2
 PFm7frxrxuUdO6B7SAnNRPlJ+MvnEyXJ9O1Nv3PnV5od03mZYp29h23tF4VYD8R8WfRAM8ekiAOJx
 pypfTCdPDngszqK9JOwFoKZepBrvUwMLvPzfI1QnhcwmoGSLsQMh8lNJole5WEQigKEa13pdHfcE9
 fqZgpTbf/tXg3cndqiVlc8nLZioR3Lg47hvyHMepA1ng4/ZYvojCR6O3A3mEXuAfVRQ6YgyBFxPDF
 LuRRB/Xg==;
Received: from mout.gmx.net ([212.227.17.22])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3FZy-0001aO-HG; Wed, 05 Aug 2020 09:19:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1596619141;
 bh=KouBFqPcVdY/N2jpqO+a5lVPiMqUcEXz0mYKHefvmGY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=SIpw4/hq/eXV/LwIQmG110HKr4dqtHrAktDj0pOcB9roVmK0hMNdYHSWo5x0qbPNm
 A45B8sQLAhNfYF+1i8I+3sjqVncRt0PrK2kVIrxCU4wSk+2NpVMuYmZGyXuwm5hodU
 ydUIVJ4cOrM5+sVbqrwBSdePMxxRhIYZJyOxtlY8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [80.208.209.197] ([80.208.209.197]) by web-mail.gmx.net
 (3c-app-gmx-bap13.server.lan [172.19.172.83]) (via HTTP); Wed, 5 Aug 2020
 10:49:56 +0200
MIME-Version: 1.0
Message-ID: <trinity-35b75199-be7e-4e56-bfc9-1d8bf7075df1-1596617396324@3c-app-gmx-bap13>
From: Frank Wunderlich <frank-w@public-files.de>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Aw: Re:  Re:  Re: [PATCH v4 6/6] arm: dts: mt7623: add display
 subsystem related device nodes
Date: Wed, 5 Aug 2020 10:49:56 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <bde8de134f59c4375e4048faf124c61af0b95920.camel@infradead.org>
References: <20200804165555.75159-1-linux@fw-web.de>
 <20200804165555.75159-8-linux@fw-web.de>
 <3966b4f687f2fabf9041059dd5f39165177a6ef6.camel@infradead.org>
 <trinity-5335a61e-b8f0-4441-9fe9-0827cdd67ce4-1596562816887@3c-app-gmx-bap28>
 <45d34c6cc19c2e5c13f9e88a8e04bdae9259ffdc.camel@infradead.org>
 <trinity-16cee263-ff59-4595-adc1-738071745162-1596612461427@3c-app-gmx-bap13>
 <bde8de134f59c4375e4048faf124c61af0b95920.camel@infradead.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:02+hrQwIbNKgot54dm3HJDNKjTwKbsyfpioUZ2s9RwWRJQMTA7VOZRh/pL3a9UGoFVTCN
 ERILIMlNaDjkc2TrLP6Gpib+y9jm1gT93Gao0qy6TOyS7ZY5Pcmiwa/hFmqqBw0sETOOim7kdheu
 QrkKaZxd7kwCxWiPRVRs9Pmzo8H/6Yf7oVgLuRlm1LNtnp20Z0bybSKu/XlUT6O3aPAOSAKdTtL+
 Z5whKcy09j+dZ6HoVVNVfUZGSTZ1QRskLbtCPoKU8es+a/aXSpcl6T8dUGYxw6dTA/aBrl0rZfzX
 vE=
X-UI-Out-Filterresults: notjunk:1;V03:K0:uvhzmjIi23E=:C+pyGM6h8H8+aYRG9JTAcD
 XVwIln+11uHGLzLGXtVC5+uvPZPCLVTtJEaOJb2YnGb9w/S8bcYDy4m+RLcsTbuQfjJTUJes6
 v44V7TcfhDP/w1IE4MS2iGXIAOsMvKSteNvGfBu/AI+W7tiPdJ5S4efQA2dwkoJJl/CyVXKcn
 yULmPFrOT1Hd727/bu+vrtbbpkXXLfQmVLMkI/ajan6cdu9QIH3voTeETjnYLiWqSUd2hcONz
 0tkoYHQQLyr5ritMRtIMAxNoxpuy/BMGlLGGLjx6OXQn8QHT4y/C3bNRDR/HRgqMurp232JRD
 FEo/6EhHYiqedjPzN5naXORqtWdjdU4Fes83M2uJwYCCdkkpedGclPVrb3zIaoZumAkNy7k6v
 EFo7atg/oU8NHyzME5cB4a+gxIMR+Vu9Wp/cjriPWHHsEmu+tXv4utH94k350fQwYA6SYA5rI
 5Wf8dFqSQhLGBs57varpTGxUvTZgwzlbGgFo17pcvI06kb4/wV5VyYTEzFn2ebxFno7zpG2mS
 yRCasz4mICn/1LBVJsB2yKefZpzpVYEWwiKxc1wkxB2eeK2N7i8EgeTAEQY0MPP2ywvhY+VgG
 Yeurbj8UrHDhswlf3xzI20kxvHJiPfksxEGLaBYZE6TYKK+TKPsp2acW06rQvCAgYk9JxuUtm
 lc3q3DLx0Iw3r9+DjBvrwHodncHhOHpqzl2tTbaYc2ThsZu5ZaR6ymOtgeV5l+GAm7Kg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200805_101922_977337_A0900126 
X-CRM114-Status: GOOD (  15.12  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Daniel Vetter <daniel@ffwll.ch>, chunhui dai <chunhui.dai@mediatek.com>,
 David Airlie <airlied@linux.ie>, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 Frank Wunderlich <linux@fw-web.de>, Bibby Hsieh <bibby.hsieh@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> Gesendet: Mittwoch, 05. August 2020 um 10:36 Uhr
> Von: "David Woodhouse" <dwmw2@infradead.org>

> > mt7623.dtsi => mt7623n.dtsi => mt7623n-bananapi-bpi-r2.dts
> > mt7623.dtsi => mt7623a.dtsi => mt7623a-unielec-u7623.dts (not existing yet,
> > openwrt seems to use a board-specific dtsi)
>
> Yes, I think we should.

i want to see what MTK/DT owner says to this...
my current way will be still adding the nodes to existing mt7623.dtsi (like ryder lee did it in original patch)
but disabling them to not break mt7623a and splitting it afterwards.

> I'll create mt7623a.dtsi and upstream the U7623 support; I think that
> can happen without conflicting with anything you do.
>
> I note that the GPU node has been added to mt7623.dtsi in 5.8 too;
> that'll want to move to the new mt7623n.dtsi that you create, along
> with your other new additions.

i guess mali-node also needs to be moved to mt7623n.dtsi, so my current way seems right...
but it's decision of MTK/DT owner. if they make a note i squash the disabling-commit into this and post v5

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
