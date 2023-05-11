Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 445DDC77B7F
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 May 2023 22:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eb3sWwf5IKoZQzOvkPaaI1IVQ2HjKkCnRKRFnGOH6+c=; b=V5q6Le12hrOEu4Y5JhlqVzc9mQ
	1GK31rm4xoBtCKaxFzBtNH9isdhWTBV9iyCwvkZrXMo3gOIQU0ug48MF9KlhPY8xAqq+x1dX13ne5
	Wk5TyWz066pk+O1Pci1hY4/DeidLJa8x0VEqzoPgJqJ0fR0AuH3ocERo1XMqyeiM2FHjIbbJ4p2No
	4ZnDpkWkc6o1e6rk90e8IqrpDDUuaQqo8Ci7EJzIeppf0qrOIKiQOjJAnvApFY0PodYL8ART+tJdm
	QSOaF4dp0+2vZGbTjk667SXRqamQGp1CxXDd77+FwcC63Se/R+OCNsxXt3crvUqLarR6LEO/sDuuV
	lQNcFqEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxEwK-00ADY6-2M;
	Thu, 11 May 2023 22:39:12 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxEwH-00AD2W-2M
	for linux-mediatek@lists.infradead.org;
	Thu, 11 May 2023 22:39:10 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-335a61eb904so537695ab.0
        for <linux-mediatek@lists.infradead.org>; Thu, 11 May 2023 15:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683844749; x=1686436749;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eb3sWwf5IKoZQzOvkPaaI1IVQ2HjKkCnRKRFnGOH6+c=;
        b=IK8Qf/ccLJxU+5T+78cr9mYEA3NHlKtpeo4eLEHDI+LKnIqxq0+CgI4jg+IqNtrCKD
         wJvm9j5b6LmPMSHfGoH30tM7uDVOPfCSh/tIE6TNWwbOXKCE/5Mbb069QWjY6wkFJUKH
         CoOQ9Pw1e2D7/iMrENQ9k5oWe9xpUs6bVT7DQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683844749; x=1686436749;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eb3sWwf5IKoZQzOvkPaaI1IVQ2HjKkCnRKRFnGOH6+c=;
        b=byVRKUzp4wLzRGdLSxahf0TslHjJhsCDzCuJjSkk+jmjt3sQpGvIhv5preII/BCh7+
         9nFB7rZW99OSt+rj4dQIqbG1RfzA4+SMRWIJ4gaFlAfnYcO4W4FI0ZNFSDEucJGX5O9d
         Z29TVw3mQIe0vLh/nuMkEePauU2d0bIOwRiXc6npM1eUNegW08K+YbUwtGeFUsym6hhh
         vdyipi1Sqk2UhpTu1kVsKQYkd6CU96L7PrV4zAgpyBNZ3EYXVALLUl7hlRMVJG0Y0KbI
         Dn0/hF/YVY3EUvEZQOT+FzDq9wRFXvCJA2S5CbOi90QBq2vxL442C8fHZ6gbGwIjXxkU
         ABoQ==
X-Gm-Message-State: AC+VfDxM1+2COIsJqdHNXh0XJOhqQaxa74ruijyNyCnHX7HNxnh14u8P
	4l9CfQlvLNBBmLqQ7cA9l1lUMH7+7gB++o0qVGZvtw==
X-Google-Smtp-Source: ACHHUZ7wqSLEyaaLGQp6CBfVVzxbKSYujepzzVu4d/1ybnzNbLqJzfDbXtwCcob4wHBhXZeVBoSrdMMDDPykJa1Dsbw=
X-Received: by 2002:a92:c563:0:b0:330:af65:de3d with SMTP id
 b3-20020a92c563000000b00330af65de3dmr13357ilj.11.1683844749308; Thu, 11 May
 2023 15:39:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230511150539.6.Ia0b6ebbaa351e3cd67e201355b9ae67783c7d718@changeid>
 <20230511150539.6.Ia0b6ebbaa351e3cd67e201355b9ae67783c7d718@changeid>
In-Reply-To: <20230511150539.6.Ia0b6ebbaa351e3cd67e201355b9ae67783c7d718@changeid>
From: Julius Werner <jwerner@chromium.org>
Date: Thu, 11 May 2023 15:38:57 -0700
Message-ID: <CAODwPW_au3i3JVAr5zfFB7ZQYrYNhG33gZ8iysijQDWK+PL98g@mail.gmail.com>
Subject: Re: [PATCH 6/6] arm64: dts: mediatek: mt8195: Add mediatek,gicr-save-quirk
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
	Seiya Wang <seiya.wang@mediatek.com>, Conor Dooley <conor+dt@kernel.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_153909_769162_BA0CF3F7 
X-CRM114-Status: UNSURE (   4.95  )
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

