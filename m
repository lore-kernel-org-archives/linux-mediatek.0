Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46983C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 17:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IPS08/iirt+b6h4wxV0wdhqqRtQF21z4KzKW0xfYghQ=; b=2+RKCUf5m5vYdh
	g8ciIHjnnWqzsCDejF1X/m5vz6qdfpcz5FqQKOMjvxWiQ0Wa7L8H37vTnmM+V1eSZ9b8iwjiqtNMz
	+CiRPXengnrjDc6zxoyneGn4brrk/IUEKU9uc4AoWx/UWumcJ9u06dJvwEfY8Xa1GbfBaYdt9a4P/
	3zSXXk0rSgyPpW+Rdwl12JFUp429YpkpFhZP2qFIITKQc82hPcU9Ls+bi7Z5OvebfmBu42CQzxtEH
	0Fpdc2Gi2oZ0ACLEQhQvJ9CWoSwUiy2chvm9xRieR9GxJaDYfSHHGwi6VU49FZAgmOe9MshCeCXX2
	f8fuHVZT4rDxoqOQctOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncs8u-000fyV-Eq; Fri, 08 Apr 2022 17:11:28 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncs8k-000fws-3V; Fri, 08 Apr 2022 17:11:19 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 8129F1F472FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649437876;
 bh=zSX0uHvk16ZFBDSFyoivkyzdt3bDJS/C1eplI/sZW/w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XISaaiX+hkZbO2SBKafmiP8WpBpWT93x0pqcJZsuVF5qp3H9YBkh/hP6U0HyBvpUA
 Ff638ip9TPevj74GLN+SHrCSEtxzQxtzEejfr/mPFSx8Ao1eX4C3DWJhOWnYm9ienv
 WKmCTZujYtmPIyVuqZLKqoSNBljXkowi2GnlXwVuali04DUhgjMTTYOLbyeM0+ODyX
 AyMt0SaN8TbyKli2iT1kxNBDNM1ZiNcmX5hvIEOCVepTzH5//JkDkgEdyWgNFcbn0h
 mtN1O3X40C1yHwHsXFqMzDM1zYpRr7MDJNehbddxa4sS0IjuvbRBU3i0eJrU2CS2Sx
 a4ml9iichWuWQ==
Date: Fri, 8 Apr 2022 13:11:12 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: qii.wang@mediatek.com, matthias.bgg@gmail.com,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 wsa@kernel.org, kernel@collabora.com
Subject: Re: [PATCH] i2c: mediatek: Optimize master_xfer() and avoid circular
 locking
Message-ID: <20220408171112.q7epy6eadha3qixy@notapiano>
References: <20220401120120.7498-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220401120120.7498-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_101118_402358_9E19ACA8 
X-CRM114-Status: GOOD (  19.14  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Angelo,

On Fri, Apr 01, 2022 at 02:01:20PM +0200, AngeloGioacchino Del Regno wrote:
> Especially (but not only) during probe, it may happen that multiple
> devices are communicating via i2c (or multiple i2c busses) and
> sometimes while others are probing asynchronously.
> For example, a Cr50 TPM may be filling entropy (or userspace may be
> reading random data) while the rt5682 (i2c) codec driver reads/sets
> some registers, like while getting/setting a clock's rate, which
> happens both during probe and during system operation.
> =

> In this driver, the mtk_i2c_transfer() function (which is the i2c
> .master_xfer() callback) was granularly managing the clocks by
> performing a clk_bulk_prepare_enable() to start them and its inverse.
> This is not only creating possible circular locking dependencies in
> the some cases (like former explaination), but it's also suboptimal,

s/explaination/explanation/

> as clk_core prepare/unprepare operations are using mutex locking,
> which creates a bit of unwanted overhead (for example, i2c trackpads
> will call master_xfer() every few milliseconds!).
> =

> With this commit, we avoid both the circular locking and additional
> overhead by changing how we handle the clocks in this driver:
> - Prepare the clocks during probe (and PM resume)
> - Enable/disable clocks in mtk_i2c_transfer()
> - Unprepare the clocks only for driver removal (and PM suspend)
> =

> For the sake of providing a full explaination: during probe, the

Ditto.

> clocks are not only prepared but also enabled, as this is needed
> for somehardware initialization but, after that, we are disabling

s/somehardware/some hardware/

> but not unpreparing them, leaving an expected state for the
> aforementioned clock handling strategy.
> =

> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

I couldn't see any performance improvements on mt8192-asurada-spherion with
this, although I didn't do any serious benchmark testing. Besides, on spher=
ion
the TPM is instead wired through SPI, so I guess most of the boot overhead
wouldn't be visible there.

In any case it did get rid of the frequent deadlocks when booting on spheri=
on,
which is already great on its own, so

Tested-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
N=EDcolas

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
