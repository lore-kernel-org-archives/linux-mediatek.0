Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E972C3DA59
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jul 2024 12:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7epGewsS+mJ+mnJ3Go9v/2WOXqDjSVE0Sbhq0kgoFuE=; b=pMajt39tMt0/Hr5b+J6383kwV0
	iSx4ur7aeHo9gDrM+K2bHpzvL3WNcQ/tP3ZNZxxwVxSWA3NuF8jNKZN5XcbERZzA5eKgMwg1fcBew
	nhL28iXbdQybEKY9Qw+F9FNv+3EZNdwNUkNzmonwWr4EpBMe11xI52hr5OsZ1+nRNFoRZChiUbdIq
	fV8lE0mzyXvu7LyYK7pjz1mQO0SXsGE1DQZaUvv+nj3LwXl3DG8kWRpucY7BHf7JXvYbN7LdGFVTM
	8/yigyxzj6L/SQYLZagJYH3mWSsQw2K8VplQF4xjrYm/it2+ZEExURaKjpSM2aPcnBNF/btury85B
	rPByAfwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTh7F-0000000ANqu-3lvh;
	Tue, 16 Jul 2024 12:17:09 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTh6u-0000000ANks-1cAy;
	Tue, 16 Jul 2024 12:16:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721132204;
	bh=rJCw4t9lWh++5hHyvwrQaAK5GI2g8BPbimI06KKCYCc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=w7m0k+SOd8zofuFtNtIc8DFMSoyULF4p95gUiJGeTIL5tw51TDAON077i/HMOsTU6
	 zOdXEdeteWHcA02RTUO8Zp3feDbTDVuQjgBBHjO9TPxg+talhgoGiJmW9yMcrsd9HH
	 gIP1Vm7UCtLOesfztNh+bgCCpMOrJ5HVxLnXtp5CNX3bRbHNzJXChaDnXcuhh3ntpl
	 keGyoVsovW4QI+KO2k1cythhTcNMWGZ3bjcRDns/A6UzuhORe5q3Y8vFH2KEp296sR
	 xQP8G3DP5PT2F904rJq9QPmA+mRSXWGMjUkG1VCi3UEY80gYUw6x9RwQ5gbbTxZ1Hl
	 zHdqP2zFpdZTQ==
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id CDD2A3781185;
	Tue, 16 Jul 2024 12:16:41 +0000 (UTC)
Date: Tue, 16 Jul 2024 08:16:39 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Tzung-Bi Shih <tzungbi@kernel.org>, kernel@collabora.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH RFC] arm64: dts: mediatek: mt8195-cherry: Remove
 keyboard-backlight node
Message-ID: <96f91c0a-e693-45db-a664-1c396b14999e@notapiano>
References: <20240715-cros-backlight-dt-probe-v1-1-0b5afe64c94b@collabora.com>
 <3dd2dcc9-5fbb-4384-985f-a61e26cc8a5f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3dd2dcc9-5fbb-4384-985f-a61e26cc8a5f@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_051648_590330_A421DEDE 
X-CRM114-Status: GOOD (  31.88  )
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

On Tue, Jul 16, 2024 at 11:24:44AM +0200, AngeloGioacchino Del Regno wrote:
> Il 15/07/24 18:09, Nícolas F. R. A. Prado ha scritto:
> > Commit 970c3a6b7aa3 ("mfd: cros_ec: Register keyboard backlight
> > subdevice") introduced support for detecting keyboard backlight
> > fuctionality through communication with the ChromeOS EC. This means that
> > the DT node is no longer used. Remove the unneeded node.
> > 
> > Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> > ---
> > Different CrosEC FW versions could potentially not support discovering
> > the keyboard backlight functionality, but I've tested both a recent
> > 
> >    tomato_v2.0.23149-099cd3e539 tomato_15699.72.0 2024-01-03
> > 
> > and an old
> > 
> >    tomato_v2.0.10686-234e646fd8 tomato_14268.0.0 2021-10-07
> > 
> > version on mt8195-cherry-tomato and on both relying only on the
> > discoverability works. I've tested on both tomato-r2 and tomato-r3. I
> > have not tested on dojo, however, as I don't have access to it.
> > 
> 
> Dojo will work anyway because those machines do share the same base FW... but
> anyway, I'm not sure that this is the right thing to do.
> 
> The commit that you mentioned says that it is meant to make that "work on machines
> without specific ACPI or OF support for the keyboard backlight", but not that the
> intention is to stop using either ACPI nor DT nodes for that.

Yes, because as I understand it not every EC might support this protocol. So
that commit just added an additional way to probe the keyboard backlight.

So we don't need to stop using the DT to probe it. But in practice we have
already stopped, as long as the EC supports the protocol (which from my testing
is always for these platforms), since that is tried first. Meaning the DT node
is now useless.

The only point in keeping the DT node would be to use it as a fallback in case
the discovery with the EC fails or breaks. But I have never seen a DT node be
there just as fallback, so it doesn't feel right to me either.

> 
> The DT kselftest is relatively young, and I suspect that anyway this is not the
> only affected device, so the justification is only barely valid.

I didn't include the failing test as part of the commit message proper as I
don't think it should justify this change. I added it just to clarify my
motivation. The test showed me that something unexpected was happening. After
looking into it I thought that a DT node that is no longer used to probe has no
point in staying around, so that's the justification that I added to the commit
message.

> 
> Don't misunderstand me, I'm not saying that I'm not okay with this, but I'd like to
> have more opinions about this.
> 
> If we choose to go this way, ideally we should remove this from all of the upstream
> Chromebook devicetrees (not only MediaTek, clearly!) so that would require a bit
> more effort to test here and there.

Note that the cherry DT is the only DT upstream with the
google,cros-kbd-led-backlight compatible. So it's really only tomato and dojo
that need to be tested.

Thanks,
Nícolas

