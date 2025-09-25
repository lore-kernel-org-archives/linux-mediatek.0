Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A47CCAC5B1
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Sep 2025 16:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k4zaJq9JJc/9ryK6cY2Xn8ASZ9hmcyfG8y41VjWW8NY=; b=VDC3a86dYqPsmS1LLfswq7RfLy
	rqzUjrtJLGklIltdF/r/Ku18cPsYnEBi/3NVW4Hy5yTQbPeZLoWHcl65UuMxys2ZJBGqLaDxYpfid
	9D1L7YgwJTXsiFGgXkuQu6ETI0o+ogD9I9D5DQVxNY7G/pCMtI/IkDcrgK91bS3lqZsrun6j+SvfG
	YPliqlFcpTzJpkPuYL69kfZ2TuMggUvKbIajy74/2cbW2G1xghKXiYMjSTHmsW5OwJ0Xq0FHC8tfj
	zpImc9FWz1utYoQSBW0HXcHYWwpgREM+7NzKthReu6zgxsYWcYWC6OYc2L/KPbq2MJzoI4sWK5dtt
	x3K2EaxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1p1Z-0000000BCwd-0ovu;
	Thu, 25 Sep 2025 16:40:53 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1p1X-0000000BCt6-0L5k
	for linux-mediatek@lists.infradead.org;
	Thu, 25 Sep 2025 16:40:52 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3f1aff41e7eso1252898f8f.0
        for <linux-mediatek@lists.infradead.org>; Thu, 25 Sep 2025 09:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758818449; x=1759423249; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k4zaJq9JJc/9ryK6cY2Xn8ASZ9hmcyfG8y41VjWW8NY=;
        b=FbQcYtL9d2YgsNRb0iMiEFJh4dFvfNLtFzGIFNk5Z9aig97t8gJVAfrbDP8tE+bINz
         GKOnDc2IHbaDP2Sa4/ozPuHc0+iY86+5hLO2v8rYZ3O8fwYxZ9gbTQWZ/H1u5TcWYebq
         jNTueF1deBhrzhCcfj1imxcsgbzb9WTidIhZP/JhAlRqXzfjmUUz75yknngPHXH01IPl
         kCDEi23EuLH/Qig2OjYtE3gHwBGkH5WCHK7l2xT17C/AV3ZFmiMDc46e2qUYmvOIvJ3I
         XzoY6kFNkUYAw0mdiGkksNDhBA/JF/Lt2ivptziUm8Ouhb3XwVcxoJbJfYmgQxw+PM6n
         zWxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758818449; x=1759423249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k4zaJq9JJc/9ryK6cY2Xn8ASZ9hmcyfG8y41VjWW8NY=;
        b=Szrz0gi3JO1hLhdOD8OeeRh/7bcrD/CL0H4HPL36ofPqGNqW+1pYLDuLmjEFOLSv6E
         ZyypWXgRXCWh99RhV+PLrnferZUaU0TiLO2zECJpk5KITAmGOJUUPT+viaVXZqKI1f6L
         lV0hXmTNwcBA0LKT9dLV0rB03IR2JxZ2kFs4m9WcjuX5WRO8mgjyWDZLtK50/m2hvyAL
         1S8qEBUrmt4rJ/8E7EAFlJlnEElp8e8LW0SOQGk+HpksE8eYbTPGsKGCSkVzVe+4naJI
         L874+/bke8FdxCplSnyJJvc/ahpd9Poj8F0Te/jJ65Q7U1+SyeCJa0k4gGWl1xqXUY+E
         rieQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9KaEdMJ9tA+QENPpgyAHBfy/LTiVT0amO9GnKdOm8O9jHcpYoF/+Iuql22JAJ3tO3TIt/gVYWQhRAngR6JQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzzkuHKLskECLtI8t1aXnrYd3hgysL4DXmUAitb45Xjis6Ot2As
	BdhbacI1iWqkV0v3qSQo9lbjiJ0EysdK9rG0zHM1KwCFQmxElUNtR91X
X-Gm-Gg: ASbGnct30xbAm06n0WPJTGYss0IgZCYTjNElexGX1QC7N5mIbr4bGdOfTXdekaIYyQw
	UPRl/Kx+h8lZMXhFgFIhKwg5h7ouSVDAiDBtimkTZsamdCv/erQ9I5QUx11MTlMhYiF/4cS9v7P
	mFEHGhPIUAw8qPSGmlu511iGLN8TmVNIweY3Qh9bL50qtmw/0dKPVpz2trDhl0dwep56/lP/CGw
	jiz52GMU0wg2x9YwivIH0Ne08bmIFBHn+YNDuC0jtB/+eKr83XAjdHRR6vc1yHVU8RU53kSfxW2
	GxLtefFTac3/5m05cd908D5lDa6xxhpwrTjIVuYPDpHjgwpCbTJFR6x9PanlGoBrQr5Dfm0eUDV
	6uZ0rLoLyrpkCEQv8MzuEFcKhaKubYZZOFX2f8jeVWDw0pXvzsdrEY18q1MwDKuXdUSy9BfQ=
X-Google-Smtp-Source: AGHT+IETYpPO9LAGX7zUAqFXRCr1IR36jr+nRkmsy96nynVShQ03CfruIEzXhdMASLXdFRjMR/RaLw==
X-Received: by 2002:a5d:5f52:0:b0:3cd:7200:e025 with SMTP id ffacd0b85a97d-40e429c98f2mr4337564f8f.5.1758818448972;
        Thu, 25 Sep 2025 09:40:48 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-40fc6921f4esm3591904f8f.44.2025.09.25.09.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 09:40:48 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 1/4] dt-bindings: crypto: Add support for Airoha AN7583 SoC
Date: Thu, 25 Sep 2025 18:40:34 +0200
Message-ID: <20250925164038.13987-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925164038.13987-1-ansuelsmth@gmail.com>
References: <20250925164038.13987-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_094051_143735_1FA7726E 
X-CRM114-Status: GOOD (  10.17  )
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

Add compatible for Airoha AN7583 SoC. The implementation is exactly the
same of Airoha EN7581 hence we add the compatible in addition to EN7581
ones.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/crypto/inside-secure,safexcel-eip93.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
index 997bf9717f9e..2269d78a4a80 100644
--- a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
+++ b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
@@ -30,6 +30,10 @@ description: |
 properties:
   compatible:
     oneOf:
+      - items:
+          - const: airoha,an7583-eip93
+          - const: airoha,en7581-eip93
+          - const: inside-secure,safexcel-eip93ies
       - items:
           - const: airoha,en7581-eip93
           - const: inside-secure,safexcel-eip93ies
-- 
2.51.0


