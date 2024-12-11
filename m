Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F5EE7717D
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2024 11:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xJB6QUNh6CJ9hfdvZdiBACbdXeZHhiadBzRtK+4ApMs=; b=Wo69zOrDQVYXqobrI0fkjrz6N3
	fqEdWJMY7L4I/0RDEmN3IUGm69jMGCALmkoYL6uqkpJo9blk0luOTltXQxf8qGdbobUODafNE/X8z
	IK/4ZPWf0dZNy/2D2+gXa11EZEURFmO5LfvsQ5GivzCX1AnLCEbWDdPTOrH1tk7GGP2PbEUSLWvey
	vqD0IoohCAkwpc5LOx1Yeqdvfox6B1uin7aQKbUkeLejfk+J4Hj/QfvbhLIhP/qhtsCTkEwFFA1V+
	6Y5g7XNV9hb6kNwodut02yDBf0WWsHuP07gBoF8GvrlDpfG4eJN/JGnVPZL1Ls32dSCsr3qqpiWmL
	sQMGuYwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLKcl-0000000Ef0M-3vK5;
	Wed, 11 Dec 2024 11:11:23 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLKcj-0000000Eezt-1EeF
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Dec 2024 11:11:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 38312A412FE;
	Wed, 11 Dec 2024 11:09:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF373C4CED2;
	Wed, 11 Dec 2024 11:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733915478;
	bh=QD7ULHKWVkhxuRiK98gMf9JFOXMuuvch3kUNLecq9q0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l2Z++UJZ42ij54T3mTbjKDuAP/LCbQpcdPKSZ55obe3Gnufnst94+GJdLhgtRqsuf
	 Ywd+z5hBuhoNwJzPnLLfXE6dElAvFg1rAKfU0GYvsOht44fzzfGx5rC90kkHx2r9py
	 WFi+BdvQ/IoB10z7NOqFKQqoRdfqDv7KWlMqEsWkqd1twe1Sc41ya298++oBINbORl
	 NhgzO+Wlyl8xdiFDPibVVdlO33rjBj1+JNOgzxZhcnYgARWioxEAFKmMQPD32SZnKx
	 WsImhGLGv9zatFaHzIfTb77tpVJ1Bad9Bk9D7MhHYDAMh/cMUnd5OSqZRLaKFas+WI
	 z5RPGaHkLST+g==
Date: Wed, 11 Dec 2024 11:11:09 +0000
From: Lee Jones <lee@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	nfraprado@collabora.com, angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com, linux@weissschuh.net,
	devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
	linux-mediatek@lists.infradead.org, bleung@chromium.org,
	groeck@chromium.org
Subject: Re: [PATCH 2/2] dt-bindings: cros-ec: Remove
 google,cros-kbd-led-backlight
Message-ID: <20241211111109.GA7139@google.com>
References: <20241206031405.1711996-1-tzungbi@kernel.org>
 <20241206031405.1711996-3-tzungbi@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241206031405.1711996-3-tzungbi@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_031121_403346_B2050C30 
X-CRM114-Status: UNSURE (   8.04  )
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

On Fri, 06 Dec 2024, Tzung-Bi Shih wrote:

> After applying 4c03a44e2668 ("arm64: dts: mediatek: mt8195-cherry: Remove
> keyboard-backlight node"), there are no users for using the OF match.
> Instead, the device is added via drivers/mfd/cros_ec_dev.c by
> 970c3a6b7aa3 ("mfd: cros_ec: Register keyboard backlight subdevice").
> 
> Remove the DT bindings.
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
>  .../chrome/google,cros-kbd-led-backlight.yaml | 36 -------------------
>  .../bindings/mfd/google,cros-ec.yaml          |  3 --

Acked-by: Lee Jones <lee@kernel.org>

>  2 files changed, 39 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/chrome/google,cros-kbd-led-backlight.yaml

-- 
Lee Jones [李琼斯]

