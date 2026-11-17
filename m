Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7638606A31C
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 11:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RQXpXZfI;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=AlhkpnS/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Ed7lLF0CP7JeqyIekPCZLpbtKsM3+dJiy8vZ0Ay8D/w=; b=RQXpXZfIZ8p4Hw
	YVX9flRe7Jk29lAuPHnBAUMcQFeQG0vP2zTy9cpqRt1OXnmHt+iacqtDp2SmxVQN5KcHWIWc95+pD
	HrsXRyHyjbjky+QoLWt5R/rste9SsRFTKs+4K0tWN7bFpkMB1lmhQjB3ExRnlNB5H8mtQMNBVL8Ck
	qz44BdhB4TVmZXjBbsBfftElx0zaNAaSQ9kBcBDI2+f23XizOBUFQF9bzd/VBLVOptHuZA/qCzLr5
	+Dwewwuqt4P6STme0zaZVuJ57dkf+XIfHV4EZwSJjgXoAYJJTZdMMjCHgWBtWQJlnZV6hez8m4JTB
	RTY3uJl6/jmT0OxsB4Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTGzx-00000005Nxs-1ZKZ;
	Tue, 17 Nov 2026 11:05:13 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTGzu-00000005Nvr-25By;
	Tue, 17 Nov 2026 11:05:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794913508;
	bh=qD+A+5r0Pu5rX+NsDc5YpHGQypt4R2BcA7Y/dGhVwQ4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AlhkpnS/onVNimPbPrBmaOEMj9/lUaCy+YIcEnteLP6km+nmS2zpGCFDaFacNKq7u
	 5ZoOl1s6+XQKXzkVpzK9842JDliGu+WXMyccOEKN002T0d+7zrv06j9n1AjKqjHdVw
	 T8y7JuGrpYakX3f8g5DrYedooFL9pi5Q9CtXWXG+qiJx5hUcsjKn4BzV4W7mGwcaow
	 piZxWPhGnzCBR8u4ECs3dp0WSN1113Gz1AM/XS03kG3q3zSnMefRoctr3amQjvmusQ
	 vcHtFyMe+NYLPm6lK0hwRZ901d+nn1kE2b7zilGaJJjEwSf/zQZqkzA2b8U4WB3V1O
	 Q+fJM/Rje8Gow==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 38C1617E07EC;
	Tue, 17 Nov 2026 12:05:08 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
In-Reply-To: <20261030103418.2355854-1-wenst@chromium.org>
References: <20261030103418.2355854-1-wenst@chromium.org>
Subject: Re: [PATCH 1/3] arm64: dts: mediatek: mt8192-asurada: Add
 ramp-delay for MT6315 regulators
Message-Id: <179491350817.164578.3923681659802112857.b4-ty@b4>
Date: Tue, 17 Nov 2026 12:05:08 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_030510_717923_40DDDD75 
X-CRM114-Status: UNSURE (   7.44  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 30 Oct 2026 18:34:15 +0800, Chen-Yu Tsai wrote:
> On Asurada, the MT6315 buck regulators (Vbcpu, Vlcpu, and Vgpu) are
> missing the regulator-ramp-delay property. Without the slew rate
> specified, voltage increases may not have settled before switching CPU
> or GPU to higher operating points, risking undervoltage crashes.
> 
> Add regulator-ramp-delay properties matching the slew rates configured
> by firmware, with values provided by MediaTek: 8000 uV/us for Vbcpu, and
> 4500 uV/us for Vlcpu and Vgpu.
> 
> [...]

Applied to v7.4-next/dts64, thanks!

[1/3] arm64: dts: mediatek: mt8192-asurada: Add ramp-delay for MT6315 regulators
      commit: 9c9f83e3368d27d1e0ba55827a171ebf551c3d0c
[2/3] arm64: dts: mediatek: mt8195-cherry: Fix ramp-delay for Vgpu
      commit: 04560888cde5fd8adc325a6ce47466f80b8c668f
[3/3] arm64: dts: mediatek: mt8186-corsola-voltorb: Add MT6319 ramp-delay
      commit: 929638df9f3b36665efd60ac71f1eed4ba36a0a5

Cheers,
Angelo



