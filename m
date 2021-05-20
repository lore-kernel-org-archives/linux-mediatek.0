Return-Path: <SRS0=cSMM=KP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE553C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 May 2021 11:17:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5702F60FEE
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 May 2021 11:17:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5702F60FEE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G/NxU/qF+B83w+/f4Ml1Y92M/xeLvm88BXpO2RmaslA=; b=F8wyYrn1qwB9GK5DTpFHcNxq/6
	U2seUFoz0hvRMI2NzTsAukOPJo6AXhJSXpkhJ1JZBDBCyT9EYaaanD3u+pvLCNVgYfbMV5Wz6TkTw
	bH1Xp4//d/UOaW7T4yZqktgUORAGBqVKmpkUlhDjZ8kZsY8sA8cBy8++mm98Lg3SArV1u8xx3ciYi
	e0WiiUa/xx1IgbQU3/L1QC+K19+vtKNpWUwcben9Vt2c3Nz9C9F3VBFER6nF7S8Fvj2ZpGpAPH7Zw
	/Jj0Cqby6WQuWI0YSoRo/M4tJC5W20pi3ERe9ajQAobWMm4+2COOhOh8y0cvInzgf19lH+q58qmQm
	+DNcl0jA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljggB-000OqY-56; Thu, 20 May 2021 11:17:27 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljgfs-000Okn-Iq
 for linux-mediatek@desiato.infradead.org; Thu, 20 May 2021 11:17:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=FFbC/8AD0LOFNwNu9BRgUtFruC/G1IwePtG3av6RsOY=; b=AJL8SzzjYJQU7p8CuKU8nOp5v2
 iYnJEK4RBJgD7SZirzzx2s3xL8NSCAM+yw9AiXKly3wq2L/zR7edDPJUIcMF7Fyyss1jKScOUlHKV
 9fwkj+VdZnUwX+srj19pzgHxBb5+Tq3Z06aUW3hBDDezlsvXIf+504lKJ2BFMK5iQul/bqMk9bNRG
 WZAGoUMtFubUIoFsvkqP1mhC0ikgvOaOeq2vTcuksLe2rkafaqu0CEczMNDS2Yr+yLHtfe9YPl++J
 czOTddZEAO7HB31VeEgumC9x8HOK2VJLUdokZ4NF1MNKjfQ7qoWS5l6AO9w5KWiTEr1XzwWnQ5k2f
 OE87f7Yw==;
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljgfp-00GEQT-5x
 for linux-mediatek@lists.infradead.org; Thu, 20 May 2021 11:17:07 +0000
Received: by mail-wm1-x32d.google.com with SMTP id
 f19-20020a05600c1553b02901794fafcfefso4540071wmg.2
 for <linux-mediatek@lists.infradead.org>; Thu, 20 May 2021 04:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FFbC/8AD0LOFNwNu9BRgUtFruC/G1IwePtG3av6RsOY=;
 b=k1LNclxtiP6W7x7zqryjIF2j1zX5LVI89E2F+ZC0OosAJK+edKHkMljCHDcNA4W6r9
 oo4eZKxNjGjNVEJ8BFhLlpoqnPMwuEiPyWw0EOz4IxxVlKUgsrlswX/caR97z6QS70oV
 NZ3/faNHyMCstTucEuXIupFp8etwQE4J3yqi0J69jZcU0Mx7BKVpa2T7q24WhNiKWtvb
 PU5LpeN250fH9rB8YtK5Dy/MNYmxcDZJKb5GKWG8MkZ5EEWxsJ6BFLPncstIQhXlrfUP
 vHUQIPzmn+0TEAFURxP+OL/A4Cij2M4dnT2BPNlHbT0nR+8xyCyGrpl/dPtQmw2IqIcV
 nkXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FFbC/8AD0LOFNwNu9BRgUtFruC/G1IwePtG3av6RsOY=;
 b=Be8egIyX29ew3uMLVnLT63t5mzE/dXzu3yT7kqbeFOFDZwZaKncxvBR4VQqQ117BYR
 OeRTP4AtCtdEevnf8nE48BJ4qpRB+KKhEQnDWYWx6h/GLzh4xGpznBh4iFk3moLhIzY5
 BS8bXLZIbO2xu5E4r/j9gILnrwgdFPn1GUOIvqmER3Z5FPg7pIfYjRbAAduTWBvohkXl
 5OYOssvJOybp2LXA1upRa90CmbSDg2PTtAbHR7llb5bDYnunGnPUdhQ4oH8xEgvKirfx
 qOB3C+fN9vc/1sp/DDT0kY1KWXKl+JzQub4l2LchtKCOA7gfnldzNyHnsLig/fVVv2Wi
 QCag==
X-Gm-Message-State: AOAM53268E52LWkjXOob62mbDJgJP26CLtszX7mJvfktK3hWbKk/HxF9
 jRWR9OsUN4ammjDJM3NGuPMcXg==
X-Google-Smtp-Source: ABdhPJy170kk8Q53GOuLn6l2Mf+w5xTtNMkRzkP4oBTF3ZetnMbI5rV9xgKJjjvpwPsSs4pLxpDMAw==
X-Received: by 2002:a1c:4d01:: with SMTP id o1mr3222583wmh.42.1621509423424;
 Thu, 20 May 2021 04:17:03 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id a19sm2310757wmb.40.2021.05.20.04.17.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 04:17:02 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>
Cc: mkorpershoek@baylibre.com, Fabien Parent <fparent@baylibre.com>,
 linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] dt-bindings: rng: mediatek: add mt8365 to mtk rng
 binding
Date: Thu, 20 May 2021 13:16:56 +0200
Message-Id: <20210520111656.66017-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520111656.66017-1-fparent@baylibre.com>
References: <20210520111656.66017-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_041705_230767_595708FC 
X-CRM114-Status: UNSURE (   9.75  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add RNG binding for MT8365 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---

v2: Write the compatible in a more compact way

 Documentation/devicetree/bindings/rng/mtk-rng.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/rng/mtk-rng.yaml b/Documentation/devicetree/bindings/rng/mtk-rng.yaml
index 4be5fc3c1409..61888e07bda0 100644
--- a/Documentation/devicetree/bindings/rng/mtk-rng.yaml
+++ b/Documentation/devicetree/bindings/rng/mtk-rng.yaml
@@ -21,6 +21,7 @@ properties:
           - enum:
               - mediatek,mt7622-rng
               - mediatek,mt7629-rng
+              - mediatek,mt8365-rng
               - mediatek,mt8516-rng
           - const: mediatek,mt7623-rng
 
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
