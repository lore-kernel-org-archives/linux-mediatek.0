Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25CF0C27C79
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jun 2024 21:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=; b=ZR/QrsmW78T7L2CxtWcaXCpV1A
	mzef6znr4a/sxeA6KC2AKIzfZIDs8Pv4A0mNfGNgDWmGd68Jbv46w9wH8K1YsQ2w+hd4Iue3Th8zN
	ODochL15eZA8uQ2rL6SZbLP7UTY1/qHrxF+jsx8vRrQtbPUEU8mT4as89qmk7nDHak7H/VmWAjRuk
	9gMzk/fChMI/mF86WB8cdFTv8vruKaPgjQSUrxGklfkFEr8m9w6fdCuF1nULzZwU9/x47M0u/BlaV
	xx5lfv/Qn/59UT4pAfpBKiJyBRItloVslE4c72yTT60Ui8S6v2LU3XgiXPrzCU2g94ZClXPbOk1aW
	dCJcgWOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKPEB-00000006kYJ-3vLA;
	Thu, 20 Jun 2024 21:21:55 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKPE9-00000006kXI-1UNg
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Jun 2024 21:21:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718918511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
	b=MEF8/Bb0/0v2buKilPCYD9tThCWlrZ0FkS+VI2RZfZfcKMNhUyH8Pu2Xsqw/AUutFC/tWQ
	X/R4fstHvwRDUNtuko0PjXAnnP5pTtF4hmFjaHQhL54v7mVrv91CnzM89jXL79IdDu/Yk6
	6ujsvKmdIk3YAJRl+fDkCjHpdX9nFo0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-130-kFN7zQxQP1ad2YjZ5VxCbw-1; Thu, 20 Jun 2024 17:21:46 -0400
X-MC-Unique: kFN7zQxQP1ad2YjZ5VxCbw-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a6ef628c5ecso71992066b.0
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Jun 2024 14:21:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718918505; x=1719523305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
        b=S1DPmQsvYI82fgZHlbf/E2RDielp8MPuP9DISqurKFIEizrHNpczyWhrBsP2MHsOdy
         u8mJaD3XE+xLBlHbAPT+hDGb7pAtMX9CWxEac30AHMXxYzh1nLTlM+pptavyB2LVhw5C
         FHmqRemdWjj8GM30Nuye3qRHb+cnDHP6PzTnHo1obkqnZwSxsRlFag2v7CMiRvIt71fp
         bnuDUNH8YqMNC43/67imfPGgniRPCWA4kZ9GwJNxhPk4zGi+cobYYiSu6L68T4ShurFu
         irA2tLOtNCFrw0vpGL8RdGruLsrXkiFOtiBeR3efLO7CqwOsfP6jIup3e7WKtYE3F8YA
         gHzA==
X-Forwarded-Encrypted: i=1; AJvYcCUMMMRuA1bTQdLlfGKEJ2hzTQXfV6JsQced8+M0CFb+FIjza09uPZj9TZQb3s0/1SqhHLcf6TPc3c5mRVOgtLPogWUYhbl8SKsK+Pn1t/I3Q2CL
X-Gm-Message-State: AOJu0YzoabapBDMBsHGgUXHhgSOVs6EvqoDDghdGXOzLOMWDFRDgj5rF
	Hz31eU0D3z7IY0rhmsokTmsN2/cAiW8IMznVfOUxXkYYOs7cTjGiPwSJ4VyUzVgqwv7Hl4Ari4Y
	+ic7vFscoJXHbrgsisUhBaLwIlmV7pq1k80rzpYgEspwk3xqcZ/cIUEJvzQ2lFoV8acjhzw==
X-Received: by 2002:a17:906:3e8f:b0:a6f:38:6968 with SMTP id a640c23a62f3a-a6fab645136mr368399266b.32.1718918505184;
        Thu, 20 Jun 2024 14:21:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFInMUkzUyLtNJEWjuXNVwdvaGVwPshtBGyRuzXTA788k2STLElQ5LZklyOjhCpKUl4EQXQow==
X-Received: by 2002:a17:906:3e8f:b0:a6f:38:6968 with SMTP id a640c23a62f3a-a6fab645136mr368398266b.32.1718918504774;
        Thu, 20 Jun 2024 14:21:44 -0700 (PDT)
Received: from avogadro.local ([151.62.196.71])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf428b9fsm11268566b.42.2024.06.20.14.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 14:21:44 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] drm/mediatek: select DRM_GEM_DMA_HELPER if DRM_FBDEV_EMULATION=y
Date: Thu, 20 Jun 2024 23:20:52 +0200
Message-ID: <20240620212142.461771-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240620054708.2230665-1-wenst@chromium.org>
References: 
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_142153_565913_D3F4B2AF 
X-CRM114-Status: UNSURE (   3.55  )
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

Queued, thanks.

Paolo


