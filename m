Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8E8C61DA4
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 14:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Km4gT3ECfAyyRS2bbW7nWVXC08VVxX8eAmF3/iuoiDg=; b=0xqO4oJ0vNg4RfZ4aar/axNTEY
	58Tn7+4juxQKLnOaNx4zq53zEUTATT1Y2H/M2tn/Gvi5r04VEAIh126ZLu0c3UM39aLnrotO3CK2B
	tx+M+QkJRif1F/9Xumnuymof9rlmOdKUi09A8+BVqMzjcr8nJjC2WmP+KhTDRl765GlMJhpqFhv5a
	uKQIyjCYbouJyfM29LViRkQvgngB4oNeZcPRIMwiG7V7Tek5cMdLyM4+pkTNazeyEMhNa4H/7SPQV
	sDCkBPFYxdxrPzkIVELXrxRy1RRXbulFXetpNm0uC54d6v9dfc5JQe9QqhBhIGEXrHm/Dm6mvz9gJ
	AEAATTUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVYkE-002hcq-Ij; Fri, 24 Feb 2023 14:08:18 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVYjh-002hO7-3E; Fri, 24 Feb 2023 14:07:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B42F2B81BEE;
	Fri, 24 Feb 2023 14:07:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4736AC433D2;
	Fri, 24 Feb 2023 14:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677247662;
	bh=Oq2cgGTNFolGMp2hlVeWgvvLAmgRBdfsEVQSk6MsZsY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uKKPbBrVYPXVtVtVuluQ0hZNDzeo41eFFiaJBZlmJc0FJjaH5Mrk83kF1sYILsIbw
	 1n03r2XCb1ES0nFnDrMH7Lv0rlDun+8sy9T3o+oJnFzJXNl36xzzZwjp1NWWV42+Gn
	 TTxeMwvLe23VtiqM2ydtEazfr3UbzOB4qYLxYUxo5S9nDBEUHtEiY259LNGL4Pixnf
	 BRJ9aUj4dKoGSGZzt5s1qHoavhf15xRRGNKbH1Np+Jo45pMHXFNsEqiSUQs/HQ9GZG
	 bwyCevc5py6Ezl7afx4i97+D6NZ4nZAkouQM5rvGSFNFQv9lcoFw5rTfnr7WWJIb8J
	 AoEF5mr50w6hA==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 24 Feb 2023 14:03:57 +0000
Subject: [PATCH 3/4] ASoC: mt8192: Report an error if when an invalid
 sidetone gain is written
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-asoc-mt8192-quick-fixes-v1-3-9a85f90368e1@kernel.org>
References: <20230223-asoc-mt8192-quick-fixes-v1-0-9a85f90368e1@kernel.org>
In-Reply-To: <20230223-asoc-mt8192-quick-fixes-v1-0-9a85f90368e1@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=729; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Oq2cgGTNFolGMp2hlVeWgvvLAmgRBdfsEVQSk6MsZsY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBj+MSiKI/9K+DYjuaCW6GBP9SMdFxb8sNVK2hWQSGR
 k0Ewe1eJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCY/jEogAKCRAk1otyXVSH0KVdB/
 sHYybcK4VnCEic3yC/2mq3YLv2JzZZtTdDOrDDzw1GALc/ous7F1BMbn4ZjyfaFgQrkmagi+4gmNmA
 burLXblBiKahWsvJsLmUjtZx7SMrkZgvon5LWoX7U4aFw6NewfZdKnyaGE8dn/0yO5wmoV16UmlI7Y
 jWlfvomJnD5oombhkBTGCqZmH3Gbgf2ILKZ918qUxPlzYnj/EWMaoqoEryj4usxbo7nHRxacdcjpDh
 3fWFVmC7mUQ/RI4hVKSRaYmIaA1Gyah+ink0ob8Yosc4fIKT9YV6WJxGghrYft6TeGK55u/1PKvbYa
 SgOkeN91Mr5CQ1HwDbxsR3G32zJLGq
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_060745_313428_3DDD9035 
X-CRM114-Status: GOOD (  11.23  )
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

Reporting an error on invalid values is optional but helpful to userspace
so do so.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/mediatek/mt8192/mt8192-dai-adda.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/mediatek/mt8192/mt8192-dai-adda.c b/sound/soc/mediatek/mt8192/mt8192-dai-adda.c
index a33d1ce33349..a02a297c0450 100644
--- a/sound/soc/mediatek/mt8192/mt8192-dai-adda.c
+++ b/sound/soc/mediatek/mt8192/mt8192-dai-adda.c
@@ -601,6 +601,8 @@ static int stf_positive_gain_set(struct snd_kcontrol *kcontrol,
 					 POSITIVE_GAIN_MASK_SFT,
 					 (gain_db / 6) << POSITIVE_GAIN_SFT,
 					 &change);
+	} else {
+		return -EINVAL;
 	}
 
 	return change;

-- 
2.30.2


