Return-Path: <SRS0=W1mV=QC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19137C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Nov 2021 14:10:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E09ED61B3D
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Nov 2021 14:10:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E09ED61B3D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d2zs7z/BeVq0DBVQs2+TN1D8k1Xkrk9D5aIPozgvXZE=; b=cgkwEpdez09nOd
	+dkn6948fKBDRA87ppz/Vbqa9EWvVK8ZT+HooI6+3/sgm9NsguZK+QjyHxotUkIg6BhW55E/aiaez
	SXXOWirtBYfUqzK0dCx7i984qHE8Z56jmlOXfvkMhbkahm00fXsi8vSOe2s6CjpN2sr7N8xn4zxM7
	vo/fZhR+IPirJ2kf6/7nrtRsFHRwNeGXQN1z72quARrnt/4EwxTBPioijWjA/5ZFQ5UqKezTB/seG
	0gUacksXP5FQCYz1U8cZkk2gfB+p3g0zN/ZuZYynQH/g8UfbrI44BibjLqixpQmRrlmK6rZbEOpis
	1xjoZmpd5cL22EcFavdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmcgq-00Fowj-Tk; Mon, 15 Nov 2021 14:10:32 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmcgn-00Foum-Nc
 for linux-mediatek@lists.infradead.org; Mon, 15 Nov 2021 14:10:31 +0000
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 795DC3F1A9
 for <linux-mediatek@lists.infradead.org>; Mon, 15 Nov 2021 14:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1636985428;
 bh=mCa20cTk0YdiDi8pE/UhUWsJguQZFp7JH5I7pKz6MkE=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=hnDoADUaxsYQKlM/lVmqHni+/BxxWKNUJ69FU6+RF++BmOZkhSzkuWMy29GwDLL9W
 IELLH+azP85Bu4e8lfYg4BS63+gEjyjxNdFy7v6VDQFUmZaqzdy9xXqJHZec4mCQuA
 X2GXuiQkUG57Qb22YZsu+NBXA6PFedDLiQ30ZV/RhOyp4StY4bB7bQsbI9WlS3eXLk
 LrWSoa3/BjrqJKe5d5p8kXx+sqn9KvQ62AU4DcD6V2SXDCpDurGoKwPuvPXAcxx+NW
 MsIbbtzHo2PCUjzFSBTSY6DOmKiVjY2zfEFfpu8mMdHSPIV5Z72WhYEk+1LxuckPiK
 6W49MqphlR9KA==
Received: by mail-lf1-f71.google.com with SMTP id
 bq29-20020a056512151d00b003ffce2467adso6787189lfb.3
 for <linux-mediatek@lists.infradead.org>; Mon, 15 Nov 2021 06:10:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mCa20cTk0YdiDi8pE/UhUWsJguQZFp7JH5I7pKz6MkE=;
 b=m7jVzmi9saDAh40oJHp5S8LKAn0uXzLZ7kXaddknvLnVxsBuNTyIl2pq4MjmW5NXxW
 d+k8gh5UQ80Zmt4u1Ozhgem8C6oF7mk+m5HaUcoKsy0axjy2Ci0F9MvSZeyH69cgfDa6
 jNhaykEWoBXNWIy2JPTXA1kBqWxfgxZPNWDDr7o3tUfLwk1Oml7MQpLOglzPDY6N5x6+
 iP7n3jVwZaS9WYYiE0sQMi76TmM8uCB1s0EpQcOfc1DLR/lrJ+G95hhuMtOwMsesRTx3
 +sgtMunUJ65BaM9tkSpMXG09CuMfzNT9/M0dmd0MVkRD8CWy/uXYceH9TWBKSMwq9AQZ
 29gA==
X-Gm-Message-State: AOAM530xNNj2R40rs7LjjBDqxSTyXppUgsJhkUWpOoqDyW1Phab/b1O3
 uNDXlLbLoghgnO8BcvrXdcqLBAJqU8u8Qsx44OW5trWvdiJ5VYjF41ue9JQrHhjZQfwb/phC29s
 CM/b7a5xOroirT0KFlBEt/6/hRh0IZj2S0RFHVjBrYN5mj+M4FQ==
X-Received: by 2002:a05:6512:203:: with SMTP id
 a3mr36529503lfo.409.1636985427953; 
 Mon, 15 Nov 2021 06:10:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxA8sjBYSj935VPORa4y/NP6odiHrvYiO7ClVmkVvCP7LH5421J7OLkoFDm4wDXttT9K8avWQ==
X-Received: by 2002:a05:6512:203:: with SMTP id
 a3mr36529471lfo.409.1636985427768; 
 Mon, 15 Nov 2021 06:10:27 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id p17sm1508215ljm.138.2021.11.15.06.10.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 06:10:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 matthias.bgg@gmail.com, yong.wu@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] memory: mtk-smi: Use ARRAY_SIZE to define
 MTK_SMI_CLK_NR_MAX
Date: Mon, 15 Nov 2021 15:10:24 +0100
Message-Id: <163698542257.136651.16595102887098305060.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211015151557.510726-1-angelogioacchino.delregno@collabora.com>
References: <20211015151557.510726-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_061029_997594_758BD74C 
X-CRM114-Status: UNSURE (   9.91  )
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

On Fri, 15 Oct 2021 17:15:57 +0200, AngeloGioacchino Del Regno wrote:
> This definition is tied to the number of SMI common clocks (the array
> mtk_smi_common_clks): improve the definition by using the ARRAY_SIZE
> macro instead. That will also reduce room for mistakes when updating
> the aforementioned array in the future.
> 
> 

Applied, thanks!

[1/1] memory: mtk-smi: Use ARRAY_SIZE to define MTK_SMI_CLK_NR_MAX
      commit: 3191e91ae15b60e69523578975bf5c6326ce1be4

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
