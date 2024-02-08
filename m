Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51FE8C4828F
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Feb 2024 09:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ClF1kcHsH8Q/55sIPMUNY08CPmP8TyHapE8bdnD9ijk=; b=BGutdZ8feWpz3inBS2jJ7X7vBs
	2KZ/KJBMxTdWBnpvE7EBAPIoesVj4S6eAXKgDXKvpGM1W0VqE6gCy78yRqFdRwOBFS2MuMdswNfR+
	TlPCUPLeiW4t4fnlnuscFJLi7c0DDbsarsEI1zERcpaYKpaGSGrC9hSXAElYo7bkHJRa9jVyWa5VN
	19o32PFTbI1uKYOvxsH0QwIbTqXMcLxSKjuRrtOj8Esw6sOTkzbvCAumzc/Lw3+ECoKqEviZarD+v
	EBDD67tuGdsQ/vP4G4+VVaClHtpcBCuisWMVv05fm9SwzLKumNWeZ+qZt+VZecNPI1sln9pBmFhJ1
	AIWlVwaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY0eH-0000000DBRV-1oyl;
	Thu, 08 Feb 2024 09:24:49 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY0eD-0000000DBOy-140L;
	Thu, 08 Feb 2024 09:24:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707384281;
	bh=UZdJqhCQtQwpF5a+Fo/W3a9Nlw0OF08YtvZFS5DdUUk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BzADfJlOlrjtaHuY5HCT+xn/qKjIgAbDRJ/yD24zKgILN9fPWJpRg2ICbble87MWy
	 C9Zp1ZV5Wm1TmqmzfK/Zta8XV6pfZnkNTT/hnh1Je/G96CPsycm3S1q/BjIymIsvvF
	 a/rSt8ixxPM/A8A1q0/UqdeZNHANXb9ygErkX63nTDjr4mZI4T7PCEBhH/kt67M3Ay
	 y2GVNyTLKprOBAWfbjFeUWsJQSuolcJnSw9+2v/SlP+kSC5CnhZLVBmJXKXQDqoYJF
	 VtG6NZ97dVUQA3WLrVpGNG6vwz3gRR1aRDXanR4Axpo6Ra9Z5e1g2oFa2ZZ4U8ennj
	 rz2gFPrDTLM2w==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id ED1C33780624;
	Thu,  8 Feb 2024 09:24:39 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	kernel@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH RESEND] arm64: dts: mediatek: mt8192-asurada: Remove CrosEC base detection node
Date: Thu,  8 Feb 2024 10:24:24 +0100
Message-ID: <170738399283.53206.14134622870926393347.b4-ty@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240207-mt8192-asurada-cbas-remove-v1-1-04cb65951975@collabora.com>
References: <20240207-mt8192-asurada-cbas-remove-v1-1-04cb65951975@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_012445_617965_FBE54FA6 
X-CRM114-Status: GOOD (  10.43  )
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


On Wed, 07 Feb 2024 15:08:42 -0500, Nícolas F. R. A. Prado wrote:
> The commit adding the ChromeOS EC to the Asurada Devicetree mistakenly
> added a base detection node. While tablet mode detection is supported by
> CrosEC and used by Hayato, it is done through the cros-ec-keyb driver.
> The base detection node, which is handled by the hid-google-hammer
> driver, also provides tablet mode detection but by checking base
> attachment status on the CrosEC, which is not supported for Asurada.
> 
> [...]

Applied to v6.8-fixes/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8192-asurada: Remove CrosEC base detection node
      https://git.kernel.org/mediatek/c/12356a73

Cheers,
Angelo


