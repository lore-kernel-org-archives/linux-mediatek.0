Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1760C77B7A
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jun 2023 17:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ocbIEO/buAl2V5qpMijhjFOCrVUowEEsiNtIJoo6zSY=; b=UvrYy6Y4SweMS2GhWS5obpWJDx
	Xz3DhYhWgJuPZCNCMA/hYr2hrRAxQpaaRBIfthJbeGqyuBxKK2uDqLwRGi9LnZFbWLf6PR0s6hn0C
	RdK2jmPEfxMvX3p/p1GjNgmCuDVpnEaoFhEt9YHe9FHdcs7kIM/z47h+4KAAKOOFwxkoeVjOsd4lN
	mVe+Yvd7On1vY6fVWd2+g+mwuopjBUQhLq5OUYm16KllDHbfBvyU+vArWTwSeBtb0UZXX7kiL9mcn
	8jc94xZDKIRRN7MJOFYDrSCfi+oKYw8TGLQyRwar4aYLZAvpBCT0a7ShRhgWu+3sX1Q4xaPZZBp4f
	QobyJX3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4lni-004MmS-33;
	Thu, 01 Jun 2023 17:09:26 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4lnf-004MlG-0T;
	Thu, 01 Jun 2023 17:09:24 +0000
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7B1ED6606ECA;
	Thu,  1 Jun 2023 18:09:16 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685639359;
	bh=Y8F29vZfkHL4Cb3ef4MuhHy4Zp5QvDAZ2kfIEyGPM9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=djfaRrFbe5vpFwhkOMJQAaXxfPSn6juAwXkAr4/vbafpbvECworn4C6+M5gHXSwC/
	 omKlx04ZB5h0aJdt1pRwK5f1fh/c0wVQDIoAhMR0OHegtLoUymiw1hnFy5Wg2yblOH
	 SoizdaLsweDvPsQ+6QiYYYElLbHJf2pVZsRtIulNG1gHSYjfdSXdHwEoGnHsI9Nrwo
	 kC9g+1xMF4lc+XJffyLIolrsX8Xe3yqm354tkULZ4uxHR3nYlYthbfVUEJ4gYxkZ+O
	 2R+0K6KZb6diN81tPegpYjt0x83mMUvzIROFsegGI+kMLOEgnoDrS86IzX3s7IGG3U
	 v3DweIR4ktFlg==
Date: Thu, 1 Jun 2023 13:09:12 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Bernhard =?utf-8?Q?Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
	daniel.lezcano@linaro.org, angelogioacchino.delregno@collabora.com,
	rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com,
	matthias.bgg@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, rdunlap@infradead.org,
	ye.xingchen@zte.com.cn, p.zabel@pengutronix.de,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	james.lo@mediatek.com, rex-bc.chen@mediatek.com,
	abailon@baylibre.com, amergnat@baylibre.com, khilman@baylibre.com
Subject: Re: [PATCH v4 0/5] Add LVTS support for mt8192
Message-ID: <572f5a88-8c2e-4324-b477-836a5024ec67@notapiano>
References: <20230530195132.2286163-1-bero@baylibre.com>
 <CAGXv+5EVfgEBDm=7MmQ=OsP322KmE23PwycJ-0LjU+3dEZygUQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5EVfgEBDm=7MmQ=OsP322KmE23PwycJ-0LjU+3dEZygUQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_100923_349210_9C59EA61 
X-CRM114-Status: GOOD (  19.98  )
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

On Wed, May 31, 2023 at 12:49:43PM +0800, Chen-Yu Tsai wrote:
> On Wed, May 31, 2023 at 3:51 AM Bernhard Rosenkränzer <bero@baylibre.com> wrote:
> >
> > From: Balsam CHIHI <bchihi@baylibre.com>
> >
> > Add full LVTS support (MCU thermal domain + AP thermal domain) to MediaTek MT8192 SoC.
> > Also, add Suspend and Resume support to LVTS Driver (all SoCs),
> > and update the documentation that describes the Calibration Data Offsets.
> >
> > Changelog:
> >     v4 :
> >         - Shrink the lvts_ap thermal sensor I/O range to 0xc00 to make
> >           room for SVS support, pointed out by
> >           AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> >
> >     v3 :
> >         - Rebased :
> >             base-commit: 6a3d37b4d885129561e1cef361216f00472f7d2e
> >         - Fix issues in v2 pointed out by Nícolas F. R. A. Prado <nfraprado@collabora.com>:
> >           Use filtered mode to make sure threshold interrupts are triggered,
> 
> I'm seeing sensor readout (either through sysfs/thermal/<x>/temp or hwmon)
> fail frequently on MT8192. If I run `sensors` (lm-sensors), at least a couple
> of the LVTS sensors would be N/A. Not sure if this is related to this change.

Yes, it is. Filtered mode has some delay associated with reading, meaning most
of the time the value isn't ready, while immediate mode is, well, pretty much
immediate and the read always succeeds.

For temperature monitoring, filtered mode should be used. It supports triggering
interrupts when crossing the thresholds. Immediate mode is meant for one-off
readings of the temperature. This is why I suggested using filtered mode.

As far as the thermal framework goes, it's ok that filtered mode doesn't always
return a value, as it will keep the old one. But of course, having the
temperature readout always work would be a desired improvement.

As for ways to achieve that, I think the intended way would be to enable the
interrupts that signal data ready on filtered mode (bits 19, 20, 21, 28), read
the temperature and cache it so it is always available when the get_temp()
callback is called. The issue with this is that it would cause *a lot* of
interrupts, which doesn't seem worth it.

Another option that comes to mind would be to enable immediate mode only during
the get_temp() callback, to immediately read a value, and return to filtered
mode at the end. That might work, but I haven't tried yet.

Thanks,
Nícolas

