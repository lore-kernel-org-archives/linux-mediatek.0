Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E98C7EE22
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 May 2023 22:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eb3sWwf5IKoZQzOvkPaaI1IVQ2HjKkCnRKRFnGOH6+c=; b=Jl7HUFLwNJppxdNlAdeUVYKrmN
	h7PtedcNNAfwitqoi3sURJj4yZJLWHvL4dVLrz/A6Ge+IXaz2UqbgoJcflJkryqwX3/pEuC4GOUX1
	H8Wi0QGrcPBO5Jkqm2ogSYZkWMO3Jbs2fM4EDUQuLOFb3EIx716e2EoYG+aI2C37ndWubHyB8puDW
	7KUlaIYbeoXv8lgzRfI0/5W/NQBMJe2Di1/zdzjven/lpwUJc693aT4+Ad3noVeUfHQNKl3Tn0yIP
	CmTxkkzuP3lkgIPDAaj/oLrZ3dBDUMLACitMMikA8MtDJsyLzjEm5IKANBY3GfoKflPh/5A7jc2qr
	elwIglTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxEvS-00AD54-1L;
	Thu, 11 May 2023 22:38:18 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxEvQ-00AD2V-1E
	for linux-mediatek@lists.infradead.org;
	Thu, 11 May 2023 22:38:17 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-335a61eb904so537425ab.0
        for <linux-mediatek@lists.infradead.org>; Thu, 11 May 2023 15:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683844694; x=1686436694;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eb3sWwf5IKoZQzOvkPaaI1IVQ2HjKkCnRKRFnGOH6+c=;
        b=eejqH/9O92EsPm8qWB0tudYgKhmb4VqybKPOzBG+lTDIcmvCNyDudD6MeNPmr7j49k
         uXR1u6U85Xpd55ege6fODvCYJg0zP0TF96UhDoTd0rDqfQzgJuODfYSUB/t8uuqVVjhy
         mHFYtthhyiYQbwHWQpCmKHINKf19mzv/Vrp98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683844694; x=1686436694;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eb3sWwf5IKoZQzOvkPaaI1IVQ2HjKkCnRKRFnGOH6+c=;
        b=dbMuAYkTRf7XJsc3VsEWEyFpyPRJdpkAX3yZb48P0W+ni0Bzd5h5tQeKxrqeM/95CI
         4bl6cHTDb/TnpRbP4ZILhgO2NLODj6v7tk50Ryq6Qwc63lyeMxfS7syHHhBytK3qzNQd
         nnT4fEFZxS++6Yv4P89LjzmrTJWaGmmt1YHBNqF1XSkLgI7hni0vxrupJzi6J3rTCaFZ
         3GUXqWZZt8doJuUo9OskXQDpIe7/XIOx1Ts6JOomgEsGINl0wo3QFCT3brdilQShSBoC
         iegZE/k95TZdO5jHXk0BhF8Nkqm39r+VlhPzKNThEnn6EHcCVPwf+6lyuvLDHmKoeJnn
         IiDg==
X-Gm-Message-State: AC+VfDyvsmAbjFq6G2cwr8IZhUzCkOIOKHDupi0dc0JHkwlLMfEySqeF
	Pt8IZtSeEli7UwyC01Qg6LmUBBCH+zTrKgujUFv3tw==
X-Google-Smtp-Source: ACHHUZ5WTdU3AW+XrAoPVq2lUePuxoUdj1Fob3vdUdL637VkgTu6Cc7qeyKA7QvxdOi9A9liBIcfGEf9zAPH4dxzyuI=
X-Received: by 2002:a05:6e02:1b81:b0:32f:7715:4482 with SMTP id
 h1-20020a056e021b8100b0032f77154482mr123404ili.4.1683844694484; Thu, 11 May
 2023 15:38:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230511150539.6.Ia0b6ebbaa351e3cd67e201355b9ae67783c7d718@changeid>
 <20230511150539.2.I88dc0a0eb1d9d537de61604cd8994ecc55c0cac1@changeid>
In-Reply-To: <20230511150539.2.I88dc0a0eb1d9d537de61604cd8994ecc55c0cac1@changeid>
From: Julius Werner <jwerner@chromium.org>
Date: Thu, 11 May 2023 15:38:02 -0700
Message-ID: <CAODwPW_amsFd2a57nv5WqXknp6o1QPvXD5tVmsxZdjMHsTjg0Q@mail.gmail.com>
Subject: Re: [PATCH 2/6] irqchip/gic-v3: Disable pseudo NMIs on Mediatek
 devices w/ firmware issues
To: Douglas Anderson <dianders@chromium.org>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, wenst@chromium.org, 
	Eddie Huang <eddie.huang@mediatek.com>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>, 
	Ben Ho <Ben.Ho@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, 
	Tinghan Shen <tinghan.shen@mediatek.com>, jwerner@chromium.org, 
	Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, yidilin@chromium.org, 
	Seiya Wang <seiya.wang@mediatek.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_153816_424161_572A666F 
X-CRM114-Status: UNSURE (   4.86  )
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

Reviewed-by: Julius Werner <jwerner@chromium.org>

