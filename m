Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B87A606A31F
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2026 21:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=awpXf+LJ;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=tH3A14tV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Mi3XzU0RNWFyJ4e7CUa62rc+wGnBh7UsoeyqdHtTKAc=; b=awpXf+LJMBeAuDY2n5Y6WxRf6t
	em7aZQa3dk62gtEDxByWddji+1GvnPjux1P6ebpvjXi29r5PQkU6VZlITQsI876EyDWBiQ0f399N7
	RyZ5NiFbdGbKmtm4noZ2RgpbBlHyviaRik+OliyGVNJiQIsHyQSdK6adlNL0JL/Z7WGUAiUXDR5M1
	2w0bE/upt2XCJAIKRxPRcQyzt8tp9ygKT/6epeplnTBuj9PrgMhdI/COJJiZ417KYH1gtWh/f4L4q
	sSqpERe2g7dCAqkX4fdQ7Nuqa5b/TjOgLVWx6Hiha05geIl2ZlptcUAbu4FUiEzgWzfKFUycyzvKa
	mSKRyHDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK04h-0000000EzRy-14c5;
	Thu, 22 Oct 2026 21:11:47 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK04e-0000000EzQW-1J0D
	for linux-mediatek@lists.infradead.org;
	Thu, 22 Oct 2026 21:11:45 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-504ae5941faso180248b6e.3
        for <linux-mediatek@lists.infradead.org>; Thu, 22 Oct 2026 14:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792703503; x=1793308303; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Mi3XzU0RNWFyJ4e7CUa62rc+wGnBh7UsoeyqdHtTKAc=;
        b=tH3A14tVUNUan2Vs+x8oyPbJRDbDmbsNkHca8hu6haYR2dwGj+WTrbgMHy8wWGLvSM
         qBGRD+v4oJCd8GwTBfq87DsDtoQwPhw5Rad/auQECXQnoPq8+SsOvhc5JQSQ3oq5NeKP
         ABg4PCstLHNC4k221ACUX3hKkeEt6Ie0CLhWArs/SdFMV/5V7dTaFSXD6EyOyGOu3yje
         pzQHqG6uuyO/0Xg3z/QQZZ0CJYSyw1XxZqw5vnqZpgOW3RHrUsgT57Vp0BqfRRONp+Hy
         CaZPWkKvXz8G7dVsmemSeTeOYlH5OCCGB3blCu+8ZOnV+v/msPywUZBnIctbiS/fe/pm
         TV8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792703503; x=1793308303;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Mi3XzU0RNWFyJ4e7CUa62rc+wGnBh7UsoeyqdHtTKAc=;
        b=ACRYi6MCWU9JdbAEowT5IwcDdotf9HPqSQnAHuIbfS3iM0+vTNQslzbAChe34TS2QR
         yXV9tEqCcHHHg2JK/WfR42v/GVMXCzehUkevmhJWIDP/spAOSCWNaCjpURWpaoKgwOvt
         8KFZC4DGUEroBK/bevfNPfsn76pXGS8FxzC6IEK05GuVBj3dPJ1LkGNeyS16ELtiVLHc
         KZn8uSqSwKEds+FMgzcyEWs+9Jh+b9A2DOFmywEA8Rj5flmHurSWJhI52JpzdaJ7+7z1
         BxImvRuc7CK8GpfV4Keh+PldNHdOaVt+s06WFoy3jKrGlbuKuZqbTmzpa6BTo0qHtWW5
         GgXw==
X-Forwarded-Encrypted: i=1; AKwUvBxxw4GjNTg4+JNSbHc5mamCvnfcvpl8yqZGHXteBbPzJPm5kEhZM2Mxa3beLTF9rLCPz3GgWhFwqzSiLx6gMw==@lists.infradead.org
X-Gm-Message-State: AFq9FYLFMMebe8KD+565mrSdqurFVQLNmlXvJNH/Xy2MH0n0PRrCBPGA
	tqeaYEFrL2insuaCyJ7Q3gLjvUk6fKuiYHIV1aTTgGVeLZ0w1Ba/Cylz
X-Gm-Gg: AYBFou12Mf6L6wDtSSAe+w/lLEwFbRJUIWgSVyEj97tNXTcIrPL9Ntjon/7MxbnMIiq
	QD0P7xNx4sSTkEemW9TvKRr/KEy9xU6aI/yfizA/PisTzrys4sm64HnpFNbYSG56eAqwny16hHI
	tv4Q376b5betYsCMB8Xj5urPRQAOyw1duYzOYo2POjw7/jbkO3cQ9kd4LUWR3L737meNokxu9pM
	vFY4PmOJQEL9m1Vbq2rdjGvi4vG8YYYk44NpLgAcHO9H4+KTct1FlfXpZscxtXFaUmZpWsSjnXJ
	/pGl6cRyr/Ug8UrH/SR0j7j/jjCSShHrouADC6PnP6gQIRhkFT3EAwgnQ+UK5P4FEcpKQzFflRN
	RvXVDdfR5dwYS2ykiZMj7LpsI+QWdxoKRYNcovgXm33bm5xnPebga7FC9D1BV7ja4STHhw3tD4I
	VOYPrH4o0tD74N39Mg1QjOu6/yyLoYDk4PubG0ZvtESskPqu+k6EZ/H99vroFi8Es4uQHn0jrxe
	3LY26GoEoycOMvJe0BGrjnfTf1IOAyanQ0dK4UZ8JzLyrMkRWt/lafcEP3gttyBRNid3FyQhJVT
	qwezv891rLRL3JhVWDNP6yjgllOQoYya2zHHrIBcR44yHu7LyCY112qUqydyVoQZV5qLnYnpyUG
	sc4e7eLvoj5jvuXJGYmvknXAUc1fNLVafeDkANdHxOo/QQ2ALMrri8cKUuc6rE2lPr6SCms0C8Z
	17RA==
X-Received: by 2002:a05:6808:1715:b0:4d6:92d4:c806 with SMTP id 5614622812f47-55be87540e8mr194875b6e.62.1792703503249;
        Thu, 22 Oct 2026 14:11:43 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55be934e467sm78324b6e.1.2026.10.22.14.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 14:11:42 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Oct 2026 15:11:41 -0600
Subject: [PATCH] dmaengine: mediatek: uart: clear the active descriptor on
 termination
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-submit-mtk-uart-dma-retire-v1-v1-1-3f9b99a9d89a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBCF4auUrB1sIrXgVcRFmr60oyTKJC1C6
 d1N7PIf5n2bShBGUrdmU4KVE79jCX1qlJttnEA8llamNVfdGkNpGQJnCvlFi5VMY7AkyCygVZN
 Hr/vu4jrtvSrGR+D5+/fvj6ML8ITLFa0fg02gQWx0cz0VDnHiiPOx2/cfk+Fa1qMAAAA=
X-Change-ID: 20261022-submit-mtk-uart-dma-retire-v1-fe71753c51ff
To: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Guillaume Ranquet <granquet@baylibre.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_141144_379523_2BE48EFF 
X-CRM114-Status: UNSURE (   9.67  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mtk_uart_apdma_issue_pending() keeps the active descriptor in desc_issued
and stores an alias in c->desc. Terminating the channel collects and frees
that list, but leaves c->desc pointing at the retired descriptor unless
the completion interrupt has already cleared it.

The next issue_pending() requires c->desc to be NULL before starting a
transfer. Canceling an active transfer can therefore leave the channel
unable to start subsequent transfers, even after synchronization.

Clear c->desc under the virtual-channel lock when collecting the terminated
descriptors, after the existing interrupt shutdown and synchronization.

Fixes: 2537b40b0a4f ("dmaengine: mediatek: do not issue a new desc if one is still current")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/mediatek/mtk-uart-apdma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek/mtk-uart-apdma.c
index f74e9a328588..d9427d56bc50 100644
--- a/drivers/dma/mediatek/mtk-uart-apdma.c
+++ b/drivers/dma/mediatek/mtk-uart-apdma.c
@@ -433,6 +433,7 @@ static int mtk_uart_apdma_terminate_all(struct dma_chan *chan)
 
 	spin_lock_irqsave(&c->vc.lock, flags);
 	vchan_get_all_descriptors(&c->vc, &head);
+	c->desc = NULL;
 	spin_unlock_irqrestore(&c->vc.lock, flags);
 
 	vchan_dma_desc_free_list(&c->vc, &head);

---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20261022-submit-mtk-uart-dma-retire-v1-fe71753c51ff

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


