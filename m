Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 300DEC4829E
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Feb 2024 01:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Kgx7mDExWIT+5iCm5UTPjTIx1r0jvWGWTR+1yqFfO8=; b=EneWL5ScsgpRkk9istCO17yzp1
	rQUVpN2SIuSAfdg6bgKxEN3YIcWY6/hj6s5N+lglwccsLPfxEyT/vJsrVItK8CavsTrrKWUReDWQn
	7F1KZlV2gpDq/4UmUxSQWTS6l1Gk8muOqubLtNPiXHrd2Sx4gMHysLOPN1OOptLHwsG1S63J2xYT/
	1SxleNAab1M9/ra1X71+2kT53kLotiZyaHxISPkHCQSV20F1a8DKD2+9PifcUXdOP3t9sSYcCqjOw
	lJK0Oz/+G2rdN1zu6vGjuhj+ZsnGcv3OBnFcQ2h0SeNs91k3CH/0o74qEw5MEmprHHBu1M1JnNAiv
	fQGYXMyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZhd6-00000007emh-15Os;
	Tue, 13 Feb 2024 01:30:36 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZhd1-00000007ejy-2COL;
	Tue, 13 Feb 2024 01:30:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CF3C3CE18C3;
	Tue, 13 Feb 2024 01:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4349C43390;
	Tue, 13 Feb 2024 01:30:28 +0000 (UTC)
Received: by mercury (Postfix, from userid 1000)
	id 9E53A106A041; Tue, 13 Feb 2024 02:30:25 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sre@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Andrew Davis <afd@ti.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-actions@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20240212162831.67838-1-afd@ti.com>
References: <20240212162831.67838-1-afd@ti.com>
Subject: Re: [PATCH v4 00/19] Remove pm_power_off use in
 drivers/power/reset
Message-Id: <170778782561.1080348.15486414819584613989.b4-ty@collabora.com>
Date: Tue, 13 Feb 2024 02:30:25 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_173031_939783_60A226E1 
X-CRM114-Status: UNSURE (   7.53  )
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


On Mon, 12 Feb 2024 10:28:12 -0600, Andrew Davis wrote:
> Use of pm_power_off is considered legacy and should be replaced with
> register_sys_off*(). Same for register_restart_handler(). Do this
> for the drivers/power/reset subsystem for all trivial cases.
> 
> Thanks,
> Andrew
> 
> [...]

Applied, thanks!

[01/19] power: reset: atc260x-poweroff: Use devm_register_sys_off_handler(RESTART)
        commit: f22e835028902b01915f584d2912cc25a397c84e
[02/19] power: reset: atc260x-poweroff: Use devm_register_sys_off_handler(POWER_OFF)
        commit: ab1439b05168dc73539e78d8b3100a0336a83bca
[03/19] power: reset: xgene-reboot: Use devm_platform_ioremap_resource() helper
        commit: 7ddfd33c6ee58ee915d09177a7dbac2c5be7b536
[04/19] power: reset: xgene-reboot: Use devm_register_sys_off_handler(RESTART)
        commit: 6af1ee028537be0a43ce939eb8f5321096208667
[05/19] power: reset: tps65086-restart: Use devm_register_sys_off_handler(RESTART)
        commit: e68b71812ebf385317c5bcf82674c109806be452
[06/19] power: reset: tps65086-restart: Remove unneeded device data struct
        commit: 11d2642e14ad022de13f261370ccddd33693c045
[07/19] power: reset: brcm-kona-reset: Use devm_register_sys_off_handler(RESTART)
        commit: 45079f206e635a08cba395a08dd3fd7629dbb24d
[08/19] power: reset: axxia-reset: Use devm_register_sys_off_handler(RESTART)
        commit: ad8d7b8002a1d3a673f2d6f110b378d137f61037
[09/19] power: reset: rmobile-reset: Use devm_platform_ioremap_resource() helper
        commit: 0867276eb12230a5e94ec2b28eba718e76b77eb1
[10/19] power: reset: rmobile-reset: Use devm_register_sys_off_handler(RESTART)
        commit: ba1188ea8be80a7bc091073792d404ab54b187b1
[11/19] power: reset: mt6323-poweroff: Use devm_register_sys_off_handler(POWER_OFF)
        commit: 6ab9137719a719f39e000aa62887ae25e1194815
[12/19] power: reset: msm-poweroff: Use devm_register_sys_off_handler(POWER_OFF)
        commit: b5711ff9171325261a7d6406b3c2b3c7752b6b8a
[13/19] power: reset: msm-poweroff: Use devm_register_sys_off_handler(RESTART)
        commit: 00ae86ebf893e0c89a7af6bfd270259e3ded93d1
[14/19] power: reset: regulator-poweroff: Use devm_register_sys_off_handler(POWER_OFF)
        commit: 77b61173c2d0ff42e5d609dc1fad137f1229f03b
[15/19] power: reset: as3722-poweroff: Use devm_register_sys_off_handler(POWER_OFF)
        commit: 348fde771ce7f5219a73750bd7a0d4c4497b1223
[16/19] power: reset: gemini-poweroff: Use devm_register_sys_off_handler(POWER_OFF)
        commit: b6475c3f81c13d6d69113f69a668c96af3a5af51
[17/19] power: reset: restart-poweroff: Use devm_register_sys_off_handler(POWER_OFF)
        commit: c3ede0b6f7dd345d8986cb69b861cadb9976782f
[18/19] power: reset: syscon-poweroff: Move device data into a struct
        commit: ffa212831289f15a92fe295a371157290619bb8f
[19/19] power: reset: syscon-poweroff: Use devm_register_sys_off_handler(POWER_OFF)
        commit: 14c5678720bdee7c5b582839a8dbcffd0c50de5c

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>


