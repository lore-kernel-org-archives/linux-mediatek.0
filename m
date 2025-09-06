Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA6DCA1002
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Sep 2025 22:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h4Id+FF5G7L/WRAYGMf/Z4zMGstEk+5riYZDe/qxmKo=; b=ORilCSDLDnSVWTrHKIW+0pPM6U
	WmwgxcN6rxLl09eSwDwBomx+4KCjteRv0++eAJOfBNxZWNhn/N+JuGHZSQr6Z1WMYLFOKNWFYKKy/
	3lq4BZspKZmJ4VUPwVbgoiqAYd5/oT204qHamDlO2s2peWdqhg0glo8cZOdw4F683tUXipHZTXwx+
	c6Q2G9w6xmtPylvvVYx13tNk74I+rj9nkUbv3D2Um5tl5Gk5UGU86cTPOFxrZhbP0ALnRmCiPAmXi
	RehiCMaYTFb1jA0moSHZXeTThGElXaFJFffFIFhzfTl/f5Ci9sJiLXskMOSgsgeWAOPVXcHdlQkgD
	WAjnc2Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uv1Ia-00000008a4S-2BSX;
	Sat, 06 Sep 2025 22:22:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uv0id-00000008WXP-3MLt;
	Sat, 06 Sep 2025 21:45:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C10C445247;
	Sat,  6 Sep 2025 21:45:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7860AC4CEF8;
	Sat,  6 Sep 2025 21:45:10 +0000 (UTC)
Received: by venus (Postfix, from userid 1000)
	id C88E1180B26; Sat, 06 Sep 2025 23:45:07 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sre@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Waqar Hameed <waqar.hameed@axis.com>
Cc: kernel@axis.com, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <pndzfcekt8w.a.out@axis.com>
References: <pndzfcekt8w.a.out@axis.com>
Subject: Re: [PATCH v2] power: supply: Remove error prints for
 devm_add_action_or_reset()
Message-Id: <175719510781.45380.7018471850966283088.b4-ty@collabora.com>
Date: Sat, 06 Sep 2025 23:45:07 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_144511_870423_44141E15 
X-CRM114-Status: UNSURE (   8.90  )
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


On Tue, 05 Aug 2025 11:33:35 +0200, Waqar Hameed wrote:
> When `devm_add_action_or_reset()` fails, it is due to a failed memory
> allocation and will thus return `-ENOMEM`. `dev_err_probe()` doesn't do
> anything when error is `-ENOMEM`. Therefore, remove the useless call to
> `dev_err_probe()` when `devm_add_action_or_reset()` fails, and just
> return the value instead.
> 
> 
> [...]

Applied, thanks!

[1/1] power: supply: Remove error prints for devm_add_action_or_reset()
      commit: 32f350d58544e2529dc8798275684e97f0a2df6f

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>


