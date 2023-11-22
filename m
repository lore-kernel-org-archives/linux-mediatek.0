Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1033C61D97
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Nov 2023 14:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gcmZVxrbcRc23EBBsMzMg3az+uJ3xujBmlpT02W14Kg=; b=Lyz3bWvKEs8JpYGuTh5pp7joMU
	jeG9klJAFUQsjtZ8YCLcyG5ZLNKKWKpcMRQC6F/Hi62Y9oyD7UCM27ibWQpg7/LnB6Hw1eKrzpJC7
	9/M+ndhQxoCx0Sm54fCGK3DCahK3wxD+SVSYaAaZJEdChYkQuc3RB5kfANKpzYVq2eSQiRXBMcSVb
	gZsqemI19XH9NM1DeYzSKn0yyMlziYCqqU1z/pSUqrodsq+NQ1LlsRY7nWGAIU7ISAifbpbdGw3Nh
	p+LI6VirR4SRur85hHa4Z2r/+33IA/uizxKPV/KgQNHXSHSj9zQLOhq9wf1hu+MVnqeeWULRX1J6U
	7TLSiHbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5nzP-002477-2R;
	Wed, 22 Nov 2023 14:14:03 +0000
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5nzL-00246N-37;
	Wed, 22 Nov 2023 14:14:01 +0000
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-1f0f160e293so4019358fac.0;
        Wed, 22 Nov 2023 06:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700662438; x=1701267238; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gcmZVxrbcRc23EBBsMzMg3az+uJ3xujBmlpT02W14Kg=;
        b=hwU0nT68CHKAL+0g1PbV0VHsRtBjMNdosm8K3EJSgjDCYRbfH58xB+T4D+fEbIcGiA
         x166YDydozNx14HFUuCBkbQsMnD2TDRcQA5o772rymIBbZ3cNF4urQFc3kcM0Jwak0U+
         CnNjPaQc4Yr6kumZzQtR+kapzYY5v+NucOn50iWe0m7sS0SGEVgkMdRaN8U5Ewucjo4X
         VMffa2QRnGApYI0ruxl4OFcPwp+Vw+NRLoOishmEzpvMJDa1uR2DiIVJd0a4heJ3SEdA
         pCjfaKKOJfx0q4hoiMw8f7cmYWFlq6r/SSfi3tf8Ese2xKmIIg0V+7dmT5ZrHcUIUUMq
         a/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700662438; x=1701267238;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gcmZVxrbcRc23EBBsMzMg3az+uJ3xujBmlpT02W14Kg=;
        b=vXP63goMsEy1qDr+o7CWyxXpaHJQRATDCS9JtDPoeySJpFZQHI+0kU89Cv4NkmUSr0
         QwbZ6mE3jKXcamrSL5728iw1kQt7zoydEHHm43TcSsVvFZw1TtV86cJZTZdY5OScTKqw
         SFYx8xiEUs4NrulGX1aQJCh8H9rm0/hUDLkHSQcmS0k9roBhyGw8DZE2f7lc7np6YvRo
         /dz8P5eAAiMcSVitRtTtUU1JgmeEJiEbQoKuUWlRb4YXjEWEfE+IDtm2patzdsSy9lp3
         auhJT62bF3zC5OMM2WdnC/DqTH01Fh1CiaTcuoY/D3ZT8G1IN69IoVaZR5ur0lPZZ5Tp
         OIVw==
X-Gm-Message-State: AOJu0YxP7k1k+wftXtB2OTTvJao3wCos3q1HXIdcRD/LWSRtEynSYExg
	+SxNc4f+aOueo+xcvgNuh4fhKdWh+WtEOe7TDH4=
X-Google-Smtp-Source: AGHT+IExCgbzsvdEhxeHyQlWxbsCi4VitxN/f7zqcWbuVIBSGrWCrRrtv+FbOiiY0V3pxrBxX/WLwjd7HdwYr4qr9Ok=
X-Received: by 2002:a05:6870:3c87:b0:1f5:ccc2:b21e with SMTP id
 gl7-20020a0568703c8700b001f5ccc2b21emr3552962oab.41.1700662437775; Wed, 22
 Nov 2023 06:13:57 -0800 (PST)
MIME-Version: 1.0
From: Bret Joseph <bretjoseph@gmail.com>
Date: Wed, 22 Nov 2023 16:13:46 +0200
Message-ID: <CAKpemQ+OFgSjyAERZqKWv3oMYVEvmURdBkmNZtESxQOsnYarKg@mail.gmail.com>
Subject: mt6370 i2c error -ETIMEDOUT: Failed to check vendor info
To: huang@richtek.com
Cc: linux-kernel@vger.kernel.org, zhiyong.tao@mediatek.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_061400_028649_8A20AB4C 
X-CRM114-Status: UNSURE (   4.59  )
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

I can't seem to get the device registered. I have the device in an I2c
node just like in the documentation

DTS code

&i2c2 {
        compatible = "mediatek,mt8186-i2c";
        &pmic@34 {
                compatible = "mediatek,mt6370";
        }
};

It seems to time out during probe.
          regmap_read(rmap, MT6370_REG_DEV_INFO, &devinfo);
returns -110

