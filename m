Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A80BCD4F52
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 May 2026 09:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y+jwi/ja6yaF5/stkK/RxqIfSDNoS1Pw6f1dCqoeh8g=; b=cLPSTjv2oiTRfgbt7qcnBXoYlL
	MIqbX1OwboaFyP8zxoyxHUGtOuWlSzHqnBxYH5g90g/zqBZB7ehlS5qo7WJLzbjQ6oVCXfKh0L4kt
	vs6j1DcmtwqfbKXueKV/enuWNwBmgL8IF/zALeao4Iq3R6Kqy4d76NA3xqEDXVB8HzOz91B4C9s72
	wgfk/OoKhVjaet205XlU6faqIs1KS4x0U5Osxi/3nlgCAUoxa4WLrK95tbe6AyHojFhUM8e7b4zoJ
	5vt7yyZnC49Gl5qFebKXoJWqeMSRzsr+XSfeKBOUQJou3KU3DjAKzUXtura7iqg1rdz0vXughLEE+
	X/cd/s7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOuSk-0000000F3op-0uRq;
	Mon, 18 May 2026 09:40:38 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOuSh-0000000F3nO-3AKK;
	Mon, 18 May 2026 09:40:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1779097232;
	bh=JI6pbX7lqlD0wSxfkIdhZ14TfT01Nxw0Xz8ExwuORAA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qY71INO3t1EhC9K8QO02wp6qwFKPCcFjKAY9iQEDomDb1mLo8ZlUC738yMvCTLLaw
	 38Q4u2TL21e3VEvp2Se3ONw1xRykY13YcqrGgZCeZWVRlwXCtN5k0vfFWrEl4KCZLV
	 0TQHJN8b5L2WNscutrMbKdIWMfVNn3RrrXDQG9CJJnFhnifoYsorRUq8oDmXhPPXPT
	 ORAH3VLk33mcb5Oazmiy2usvE2JoIxYSRlLuLodCDjcvuZSSP/9NtR8iuMJPqunGHM
	 EBpPRM4AUNqYOP28Xe4aU+Fy5tBjICoKap/T0QGqMwZMMI0AdE14hDdEcSMsyBLnrj
	 d0naqypzpwqfA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3886F17E0234;
	Mon, 18 May 2026 11:40:32 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260514101254.2749300-1-wenst@chromium.org>
References: <20260514101254.2749300-1-wenst@chromium.org>
Subject: Re: [PATCH 0/4] arm64: dts: mediatek: random Chromebook cleanups
Message-Id: <177909723215.34575.4108688585105248278.b4-ty@collabora.com>
Date: Mon, 18 May 2026 11:40:32 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_024035_941779_CF76A066 
X-CRM114-Status: UNSURE (   7.61  )
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

On Thu, 14 May 2026 18:12:48 +0800, Chen-Yu Tsai wrote:
> Here are some random DT cleanups that are not directly related to other
> topics I'm working on, but came up when checking for warnings.
> 
> The regulator related changes overlap with my other "Regulator cleanup
> for Chromebooks" series [1].
> 
> Please have a look.
> 
> [...]

Applied to v7.1-next/dts64, thanks!

[1/4] arm64: dts: mediatek: mt8192-asurada: Fix SPI-NOR flash compatible
      commit: 95937cbb6d51e0c6f8ac937bd043fb3b442391ec
[2/4] arm64: dts: mediatek: mt8192-asurada: Add (BT|WIFI)_KILL_1V8_L GPIO line names
      commit: c42235145c52955ab20fcb648bb8c7818f58282b
[3/4] arm64: dts: mediatek: mt8195-cherry: Fix names for EC controlled regulators
      commit: 2066ac078402301d9aa50026dee017182d316eac
[4/4] arm64: dts: mediatek: mt8195-cherry: Sort top level nodes correctly
      commit: 559b8b1524760ad8dc18d52c4415d40ee24d02fc

Cheers,
Angelo



