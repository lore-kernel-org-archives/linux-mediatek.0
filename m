Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3371C88E4D
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2026 22:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6vUsjOcpEaz7YRWIojr47OABCNDJbVfwV9m8A/tQCO8=; b=yWgwGfmB37Xys+QhwKw42Y5hX1
	RULa6Q1E7bXibB2g6wrQt45YwXR2TswvgUrYjeq8q397e4wkcn2/ST3SttTRwkmSN9NLNThFM/bxG
	V1+uJZ7bf6rC/rVxpP0XfTwlRU5EVcSW2Q/i39TLeTdCWUMx05ko07dopIo7MCnL/fO5E23FTLP9v
	4yzF+D9uvthqHO9oQjNHvmG6W/xNXiPODz2Oh1aJFKgs/j6IEZ56YEdAB5SCsb2slL1xHUBBUDu/3
	CW++dXFAiilLGttrokhOg/XNWKpicwMtObv6oDT80MA5ORkobMfNsmB1PWrFsrooaZJIfFup91zJN
	mEQP9f1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x59pp-00000000H9L-3oMi;
	Fri, 11 Sep 2026 22:35:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x59pn-00000000H80-0zsC
	for linux-mediatek@lists.infradead.org;
	Fri, 11 Sep 2026 22:35:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789166100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6vUsjOcpEaz7YRWIojr47OABCNDJbVfwV9m8A/tQCO8=;
	b=XPl/gZhtWjYPLveAEhp32pGkbKr2LUZCt3+606lWbLVwlOPQz7iHZHZZaYX5qvXjDPhklb
	1ez77BXkTuLCs+TPF64qyBNRmWbT5AkS07PABReDiQB8Rc7wAZ47dI6VGcOBZkY2fQG+hT
	pwPeuLJIa46CBiqxHeBJd6MDEqiDqXc=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-348-dTUxqlu8OB-_1wlJnLRZ8A-1; Fri, 11 Sep 2026 18:34:59 -0400
X-MC-Unique: dTUxqlu8OB-_1wlJnLRZ8A-1
X-Mimecast-MFC-AGG-ID: dTUxqlu8OB-_1wlJnLRZ8A_1789166099
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5304f2b5946so27906361cf.3
        for <linux-mediatek@lists.infradead.org>; Fri, 11 Sep 2026 15:34:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789166099; x=1789770899;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6vUsjOcpEaz7YRWIojr47OABCNDJbVfwV9m8A/tQCO8=;
        b=kWYOtw0uOJ8geNBVFZd5NCsx9+2ZBzb4TK557AAcr2I3el92AD7cRsVTbbed4Fowix
         RESmNpFWqInwo+OXC2lz0kAvNJgV4NKLG7Fjj3P7SN/DMnFzk1G7x2KVSOFS/kPw8BAV
         eLqnfTSZm0AMA/lPQEAblRueyj9oLK5yAwGt8kB7tRsazKrXwo5io7EwtUOoa+DhTAEL
         w5ekhUTQV3yTp7xyU0iG1Y0b7JLOLqeZCarNDMrbtiWObx8VPHvlPPfep7WRLc/kxQzg
         88FFZe2aYUtYgBDotLBFIpXGOwJMf3OjIzWpuy4xKCRyNmIuQZnG/ztfFvKQTjxzqYaO
         AOjw==
X-Forwarded-Encrypted: i=1; AKwUvBwt96uWukYCVzGcImFJRDa3zCJ5Coaza87N67IkIb2ziTsTDbnf7lc3TdPDGLIlgzf/mj3rtCBgD5GKju6F9Q==@lists.infradead.org
X-Gm-Message-State: AFuF++npx0ZONtxoYdJswYUQ1CJRhhHmPNvPl4VcZzk8s9jtKGEmXD5q
	Z3cdXKULRQZZ/dNwyOBNVUkyozirH3+YMFxpIuvv1huqkv9p2lJ+/2/Ge//NJhhl0IoZFhU7GtU
	n1cVk3bfVKJ2aSjJW7xpKdLiz/4OaPCdJTF6s9LffFFZ1/LAKznpznmgvgfZTHWQaHT2XKglndA
	==
X-Gm-Gg: AYBFou2c/dpQIkfxcfQ9GrWbY82miVvIkziqqF4ZUc5i6dzp0FM066y3IDBE4peVdwG
	vqjsR6iA9FIo0kE6TIizALUUf0CKk0NwiyMr4ED22sjJwY7fA8XS9KIGKTKhiYqsj5rzAGTyJF0
	pqW+sMOBIOOhUDUMXCxr49rAXRVfpWOdwMaNDtNtXymTFxRrvVPRhGOb1Qd/bbqIosV/heTJrNi
	sMpmoGESP4TYb3acJRhfNaYJJXo5fxmJKctThFyU5xiz4KRy6bsBRXrl62iUiw8jc0E0hzFRNAp
	e+MPjLwM22Y8IxYQsZVqtnYUWJumtIHoYUVDizrmP4dc5MhitT89LXGD2yUQWfXtiZQOkoyRlBQ
	wFh3JaOUTg8RDEDD2672HSl94qWjgT3/qcgrIpYpN
X-Received: by 2002:a05:622a:1a8b:b0:528:38b1:b547 with SMTP id d75a77b69052e-530c8510528mr108925791cf.8.1789166098958;
        Fri, 11 Sep 2026 15:34:58 -0700 (PDT)
X-Received: by 2002:a05:622a:1a8b:b0:528:38b1:b547 with SMTP id d75a77b69052e-530c8510528mr108925361cf.8.1789166098564;
        Fri, 11 Sep 2026 15:34:58 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530cc781402sm28631931cf.7.2026.09.11.15.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:34:57 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Karl Mehltretter <kmehltretter@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Rex-BC Chen <rex-bc.chen@mediatek.com>, linux-clk@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260910033000.15926-1-kmehltretter@gmail.com>
References: <20260910033000.15926-1-kmehltretter@gmail.com>
Subject: Re: [PATCH] clk: mediatek: reset: Fix device registration
 kernel-doc
Message-Id: <178916608638.746679.11554691931309415049.b4-ty@b4>
Date: Fri, 11 Sep 2026 18:34:46 -0400
MIME-Version: 1.0
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=320; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=F5o1tXYctjSgBI/LtZLOoWzWpvKzHWB6U29+4E8/BK8=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLKWNHGz1Rv9ef7R/H6WvYPKyV69j11R4Wk/pTJCPIN5v
 ML2ynt0lLIwiHExyIopsizJNSqISF1le++OJgvMHFYmkCEMXJwCMJGyaYwM99cy8j566Wpfs/h3
 CNuZP0GXPdlV1c57rtc46s+d94IpnuF/Crv6VYVM/yli7qwb+PrEI+6n7TIX2/1T7fjfJYw6p2Z
 zAAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ezZX2_Rae3ly0eCzPoTZ8vYXazUIORM9Iv8rAr2EoZY_1789166099
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_153503_356040_9382E6A0 
X-CRM114-Status: UNSURE (   5.30  )
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


On Thu, 10 Sep 2026 05:30:00 +0200, Karl Mehltretter wrote:
> clk: mediatek: reset: Fix device registration kernel-doc

Applied, thanks!

[1/1] clk: mediatek: reset: Fix device registration kernel-doc
      commit: 8d5fa37307ac1f0612cf17ac0ccabcc258cc1526

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


