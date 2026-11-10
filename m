Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FFF60A380C
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 21:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BgYcbHCO;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=nQOipoh5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ctVOchLtZ/i0vJd2/vqfjh8ZPAFvZBxtNydVJLZOi7Y=; b=BgYcbHCObluqIc
	AxD4omr8vIHzhv4Cd3cyM5bwnlSF67QvsU5+4iTAJJQ92pUKNo6s7wb4W0aqgrhvfMUuIh3yX2iHz
	ftNqKuhIX0ZoOW0kZG4axK8XPlING0k/WrhS1uuQD9hsYmqtM6WzJFYwXav4meMWxVdDzF11aYEiT
	/qefz15wcVeqqJ8bINAJ4DvTmey2EB1YA9UX3OGsFlD26nXU6Ir+I31GJJyHsVxGFOvw1sfWsBXx2
	qv4ow4St2jtQF5HjF4BBc9/QUgfbryQduyn1MSSv5Aejjh1SVyAytLWtFw4pv0pkK9zLSbCiuo9fH
	IDSz9gVZCobdXj7hmt0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQtoy-000000055yf-3bef;
	Tue, 10 Nov 2026 21:56:04 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQtov-000000055vN-3Qfa
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Nov 2026 21:56:03 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-49134c8509fso2094561f8f.1
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Nov 2026 13:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794347760; x=1794952560; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ctVOchLtZ/i0vJd2/vqfjh8ZPAFvZBxtNydVJLZOi7Y=;
        b=nQOipoh5XGweOz88AhMKP4W2By5Gd80K8If3QB1lzQHam4MQN0WT9u7/lgeBcOcdT9
         xKOlsBa9uvvWo4BxXk3eyiwcIXAmmqvec/mMH7r40NSquRFpRq6NBZkJDsQQLp42yKI6
         3QVpfv8IWtmHj+D0YTvanr3YZ/Uyad7zIvPsG4flybSeg5Vn+O3ieKG3G/Bh1ZbBWsuM
         ftg6lgi3/4uF3EuV2t8ahL13dESRhN7p/CmM3XJvSWNeo524sdODs8xUWjB1DSgkvwWe
         IO6giMTOI0A8ZXKMRCcmIRkPOXOn9EDaFkaT/n5fOG9y6H7wG1knfP85oiAU5C0iD4qU
         8Z5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794347760; x=1794952560;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ctVOchLtZ/i0vJd2/vqfjh8ZPAFvZBxtNydVJLZOi7Y=;
        b=wqYMbGX+ChclJArelwBa9aYNWPpWS+FO2hMsxVg5Z3xRuzNi+4HKRZy0PSe6atZxMw
         qCW0ZMgitokp3SD2gUnHoNaAAyd95rmQIa/SgM7ElSMD/10q/HoVbuVx8d7pabPcbUTS
         JFcuVx+uKkNLEJtqgZayU7m02sQdTZVBhx2KzyVU2y8Pqc+vT7sRtURoZh7UaPcT1QQT
         KBwh9gfAknYR3DNxSUUyc50Ksn5nX8zRq5vh2sdSB7f1DKUam/fbdwsuZbP2SjeMhWLu
         qVHPGIJ3mbS6SeCYtrwMpzM0BPLURQ9obegSDoiQG0u8JxzeMe86YjE6mlyruwJjdxWn
         NTmw==
X-Forwarded-Encrypted: i=1; AL+hErFVakEKhLuBsWRj7qDB8CNzA6Amtvywg2j1vMqHqZuQE/NqNeHy4z3wi4YAS1OEka6PcSP/mWvMpPzBOmpiCQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+dnspEOu2gaOCczUXqivbQBfdSh3/Fx1aMKNt3mWLmGVl2IaD5
	bWD2PTCgBPqfiywC8G3PUD4XGda2F9dfH1g0lreQybI2bNIxTCgU2z75BiYnpRaD8/o=
X-Gm-Gg: AYBFou3+SOSVX7h9Un7n5IqjarEyNZYtoUkD9mgD6fGMLMgs772W7tIlWL2JAG/+m64
	eB015YaxtV+ySuYwvT3viHWS6x+ugwq3es0dinszLBMesLksfvgtlAfSRxSjFNfrwOQFtRCNybL
	U7z0m1GFFJvc8/BNYzgUsjRkM0a09FMPoymyDi6JEVLsV7gPn7hoWtKE/ZSIKVqrz29Q1nNgDLJ
	lGjt5t32dZ/RdxkjPC9yeFqg7WErmPWzNdjOLwSpFyI62SZeeG3gjrMbxdTpO4iulOyfyibcUzh
	MIqwnhNo9BspnD6FEy68Fck0+/KV8YFnvOyn34nijpPr47WV3WXrsFlUhuvVJbf1hlTPS9rU3b8
	zu8KL1vYPGGEVnIgrmf8y9TbssCRMifhjCiHDoKrqVVHb/UojrsA3YsqseTp+FjgwCrC26Lvxi5
	pcKv0yvU3vqKZA28CwrPfAMVOFeJw1x6cmrbhW5hTMPBv/p493dMs6gTvgmjUIlaxLp5YUogRhX
	7Josb2joq2AgCjfEeJpWpU/1ZvfmlXjm4JLNHIDT02daT3+DPO4k+UaVYAxPvwsBlQ6NOr6E3Z5
	3kDPgCKEI4+iQ0DMYxzmBwNFj13KfAAjDw==
X-Received: by 2002:a05:6000:402c:b0:492:820d:107e with SMTP id ffacd0b85a97d-499c792ef4emr428787f8f.47.1794347759890;
        Tue, 10 Nov 2026 13:55:59 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4988bdef64dsm5664845f8f.20.2026.11.10.13.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:55:59 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v4 05/20] mfd: mt6360: Drop irrelevant __maybe_unused
Date: Tue, 10 Nov 2026 22:54:30 +0100
Message-ID: <f24ff673333c0fe34408abf1a4f013eeeb5b63d2.1794347059.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1019; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=WVXc1FvtvHtwehAQUPEvKaZfuWX+hZavONn/+2WOSYw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq85KisuoYTGXVnjuOAoBv1WtV1Dwwmw2ojVv8v Er1hTByizaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCavOSogAKCRCPgPtYfRL+ Tt58CACDo/1F4WSgBgjg4oDThZrM6JlYHXkQrOBvMkMkN/laIz2ikPQOpQcH6kb1HJ8KJICzPkL nfRlyhLgE/4bzVPNjE3WM5My9hgSQ4RpVWEWH60bylCAJ11pxX2cVVohWpRVn+y+R/9aa/4zl3L rvKkcDx2LZHxL/56lhEcX2R4suG/y5AkIlhXL1SAz63gSvvtJJYRPrnEt9TvbnByWDDTe3MYns7 odPfiaSK40lzbMugKCueM5ixaCZQBeGFzfqChaFn3vmtjN/AYYQ+vk2OVcJDXbDbkLJaLH5peEc R/SfnNv9Eoz8HYLAASLC1o3YqZMqweOx9lMdqz/6Z9nDEq7I
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_135601_891312_619A6F2B 
X-CRM114-Status: GOOD (  12.86  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since commit 5ab23c7923a1 ("modpost: Create modalias for builtin
modules") MODULE_DEVICE_TABLE() is enough to reference a device id array
even if the driver is built-in. So mt6360_of_id[] is always used and the
__maybe_unused marker serves no purpose and can be dropped.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/mt6360-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
index 8a97c30cad3f..8263e3ff8315 100644
--- a/drivers/mfd/mt6360-core.c
+++ b/drivers/mfd/mt6360-core.c
@@ -606,7 +606,7 @@ static int mt6360_resume(struct device *dev)
 
 static DEFINE_SIMPLE_DEV_PM_OPS(mt6360_pm_ops, mt6360_suspend, mt6360_resume);
 
-static const struct of_device_id __maybe_unused mt6360_of_id[] = {
+static const struct of_device_id mt6360_of_id[] = {
 	{ .compatible = "mediatek,mt6360", },
 	{},
 };
-- 
2.56.0.rc1


