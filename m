Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 276E4D5B161
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Dec 2025 07:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qQSdcWZiGnLdxDJNWxTQS2nftXWRg/xYrou3KzxDI4o=; b=DRdkHYuqz6GtGn0w62IFvDXMF8
	yTNU2ApQ3nJKNonMigWovQNXf0k4/8dGaTZzm2Gt/U0RUqMDJt9QoEajnMg+zNUV0YkNe4u+sCIxF
	Fqm3LFXROUKSqi1NJT5jyUsDk+ZYPulYfrkI5t1KZSFYc8m7HKDCnQPwaBvQP4ebyn+tT13bYo74G
	0rKlfvHVKKhLxen+fgJtKeq+E/RWbKxwcONBrRecoIzeR0FgHd7MASfH9yo59PhGbBOE9m2z0RDS1
	/fMXAFka5qUeEaRseMF0MyZ7jzMT3Q3yVrAMf8xSgbsQ7JWSLT1RtlBSkupCM/b/GFL1dRorqxqKF
	tDwYpN4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVPOe-00000004qJ5-0hvT;
	Tue, 16 Dec 2025 07:23:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVPOb-00000004qIa-3pQd
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Dec 2025 07:22:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5130F42E2C;
	Tue, 16 Dec 2025 07:22:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F30FC113D0;
	Tue, 16 Dec 2025 07:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765869777;
	bh=vgei6H8uXbsw7gSUS2+78ZQHorMPpOcwSHomCZQqeB8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DYjlo2VPY7yPJNpgEe1T/yrVtWR+yF/jF52rm/cGv+Nl2QQBNy8z/YHlA08uld6TX
	 rF8toFpSrybVZjiIex1UCxqszryOPQTnkKW7K4etJZbupFawAcKnoku5Hdr0FyVAuQ
	 /xKHiRnfBm3GmL2zb5v5lLsjhmNBP31Ycm75AuHABkEefQL/8EmmwRc5KlssNsVgfH
	 dvuYFK7+GfgAkRx/zsQ9+6Qn8ed/ATb7kLrVg8TsvV1mNgwJHzGeMmPhpybf3nXQYF
	 Ceq4nYbKsTS0U7NXwrpajsWgfMXtZUfQQkN/wFTHNjklVowwuzcLmUvTO+XVaX1oht
	 4qGkM6K6tgrpw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>,
	Johan Hovold <johan@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] memory: mtk-smi: fix device leaks on probe
Date: Tue, 16 Dec 2025 08:22:50 +0100
Message-ID: <176586971950.24797.1201839384601647110.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251121164624.13685-1-johan@kernel.org>
References: <20251121164624.13685-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=903; i=krzk@kernel.org; h=from:subject:message-id; bh=lvMdiNELiS4H8mOFGrWoPrGgninHMZUuM4PBvYPE4yA=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpQQjLf9w9RlwFmFOV52yUKZIE6MnHl3iilzJVu pdS7zVuarWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUEIywAKCRDBN2bmhouD 15KIEACY9TmyXFzGZf0B/Qz+oQTdVfqx52ggZ4UJtNmk45OBFdVFBZ7msNGnttyEUMAhnbB8dC9 Y9r/PNpgWQqSc+0XgbxNXhXgx1Hlcl67aRmVXeUaaMZmvPx5vob0HNvz02epP4XU1tOuWLpeCVr MQMJuGP1cApF4qjlJBUlkKKH0m9UqH/M0ol7DawHd4d8qV5eMXxCAP55CF4llLjOigWIgYIWi4J 0fPbwaNB8tfr9GWa44toL7qnuHMCEcbtL9Hlb5YdviPKLfYqN0TPeMDrfkW9OHQICg/zWqrhPm9 j7QSghIqV7eV7pCpZr12qZZQiz6xGSDS4LDVNQkfbTTm1Lg5b/Veye6c2mJmT7hNKJN2G4b3/fb irHZgf9kZYwKQ26gJ0FjBwppA/7YypdFYx7afrvvd7mHYvpGTk8m2tzQnRvRAlusLsqFJrdjHya HEsbh1D/oL5gNwWjmF9vC975eS2sXBSuBzJ8vEv/EGZK0isPXyPcH94lmcambv9N0X2wjYaOJ6I 1vePaKNwgIGGPdqEhFWQ0ChJ7e6BIVOTrHBz20kfrl/yKvy7e4hTuDtowjohN80TvTV0k5m41QH 8li8zBVjzAd+n28f9ywI10zNcbVQWNalixN1mf+cwTV5ww9m31hRxf1tUbOrfLR7ZzkWIg4GSky jqmOucVLxfz0O9
 Q==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_232257_971714_CE3438AE 
X-CRM114-Status: UNSURE (   8.99  )
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


On Fri, 21 Nov 2025 17:46:21 +0100, Johan Hovold wrote:
> Make sure to drop the reference taken when looking up the SMI device
> during probe on late probe failure (e.g. probe deferral) and on driver
> unbind.
> 
> Included is also a related cleanup.
> 
> Johan
> 
> [...]

I fixed up stable-cc syntax - missing final Cc, because only prerequisite was
mentioned.

Applied, thanks!

[1/3] memory: mtk-smi: fix device leaks on common probe
      https://git.kernel.org/krzk/linux-mem-ctrl/c/6cfa038bddd710f544076ea2ef7792fc82fbedd6
[2/3] memory: mtk-smi: fix device leak on larb probe
      https://git.kernel.org/krzk/linux-mem-ctrl/c/9dae65913b32d05dbc8ff4b8a6bf04a0e49a8eb6
[3/3] memory: mtk-smi: clean up device link creation
      https://git.kernel.org/krzk/linux-mem-ctrl/c/78da7027e2a99edea0d7e97b25d75be4698a8728

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

