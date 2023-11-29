Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C32F4C4167B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Nov 2023 21:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oRzm+EBY8lURs31kY2MOOY72V50zWEq0T4zxegoq0uI=; b=1aftJ1jxDP9kD4x7zrPYkAzcUI
	ujpfH4ZsAynnOsLXl2QaUwTVQYofj85/ZD4oXuR4o2yX0Hq0Q3qvw9ud49JcWGGOGX+qAmiIY1/zY
	3qua3lJ0RJdF7Z3OvM3JxM/mdOZSM5x9tThd2pnHZ9/aklOMIzQp7W96fL2bqzBG4EanR6zrfnEEx
	BUDOti80eokYeojq/3Xtm13mgNizPlzG1h6RDtXy2o/VDsBTL3uYj1VWncafBr7ajiBdgqAYvLufJ
	gFzwaIyRebVxCVo31x9R1ccW/Mlx0mQa5ygsVSZ2fZUluRYeBNAPrRNbi+FeU3nAFxl/44Agzwx2a
	SwOg/GRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Ryd-009J7X-1Q;
	Wed, 29 Nov 2023 21:20:11 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Rya-009J6T-2W;
	Wed, 29 Nov 2023 21:20:10 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1cfc3f50504so2337585ad.3;
        Wed, 29 Nov 2023 13:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701292805; x=1701897605; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oRzm+EBY8lURs31kY2MOOY72V50zWEq0T4zxegoq0uI=;
        b=e2DQpc5mxlSJWNAW7oZlWvJA674QbUWrKFjgt8UmIwevJBmg+ChZlUAV6i9GlFZ3Wm
         TX5hZyMxUz0it25R5tp1MfeM650tlJIjVGYroMwdCu5Sy1Tw7UxzCvq5pOZ6hbazmczR
         RqdWeRBYfSto+kvmU8uN/MyZf0Fbhs8Uw00PArW44dHDBFbOJyqGEJ4QgQjF8W5IsU/v
         dlg/NwAHkRMbpQ2nctDSahFSBhk4q8jpt9rTPg2hSx5+RbecrkDzvZ8NlkkMEHyoM0FH
         0JK5h8/CPYUFGh4iKMWGNnn2aw0L8olhhXjEBnz0fuPIUkXDEqpnjvkwFxnSmUf8V6Za
         3F6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701292805; x=1701897605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oRzm+EBY8lURs31kY2MOOY72V50zWEq0T4zxegoq0uI=;
        b=Kvpk422FKwvvlaDiXLkfEprZ/0dkejfw2k1OdfCQDZJwYZ240EKd0QMIgzTgdQwgPA
         a1zw4+aVjqC7dVyS+2BC8w12ZIjtrp0r3CzgYEudJKD3pAqmQpXevJT81Wr7UpXfcl+A
         d6VbzOQGM2SXhQFUhojmYIgSaxI0RU4ouA6J/qsyFufYqPljqyfIYHij0Pi4p7vlgzI6
         4hcth+D/1MDGRVZ6eI8jIp6M6H4kZ6QH3/xTpesX1cUtNMnQ04/d4OzuMkpiJPKYLebm
         Xj0c04YEH0gAJBJCTtMHLDFYk4j7rnn9kHTmMRWe0xyKsteUbuBTScQZ4X/Wy2XQBaAN
         r3DQ==
X-Gm-Message-State: AOJu0YzWyc+8cDltyPPWWDXZ9VFRyT3Hl8HZddMahnIrQiy9gRBLfSW3
	a8hgmD4HSmd8UtZp1EZYaWU=
X-Google-Smtp-Source: AGHT+IGIE4ijk3eHmnRzx35ZgI1veKT53AndkVUbNYATlXqAIeUX8alKZiZFLlbEiokkL4jkg+JZLw==
X-Received: by 2002:a17:90b:4a8c:b0:285:b8d2:cad4 with SMTP id lp12-20020a17090b4a8c00b00285b8d2cad4mr13229826pjb.17.1701292805224;
        Wed, 29 Nov 2023 13:20:05 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:64f2:7004:43e0:6095])
        by smtp.gmail.com with ESMTPSA id bk8-20020a17090b080800b00285a17f9da1sm1839436pjb.43.2023.11.29.13.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 13:20:04 -0800 (PST)
Date: Wed, 29 Nov 2023 13:20:02 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: input: mediatek,pmic-keys: Drop incomplete
 example
Message-ID: <ZWerAi4CDFUz4Lk2@google.com>
References: <20231128214816.3975893-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231128214816.3975893-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_132008_821789_17F5B107 
X-CRM114-Status: GOOD (  11.51  )
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

On Tue, Nov 28, 2023 at 03:48:16PM -0600, Rob Herring wrote:
> The example for the Mediatek PMIC keys is incomplete as the binding is
> the full PMIC, not just the sub-functions. It is preferred for MFD
> examples to be complete in the top-level MFD device binding rather than
> piecemeal in each sub-function binding.
> 
> This also fixes an undocumented (by schema) compatible warning for
> "mediatek,mt6397".
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Applied, thank you.

-- 
Dmitry

