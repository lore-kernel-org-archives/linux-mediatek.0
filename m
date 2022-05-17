Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0911C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 14:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tSr4nGbv/T+eMEvlAt64foHu6dFJrQTpTc6x8cjTuLk=; b=sXxnnGs823slU1
	SGgrpa8aSa5OAvs6s4cOobW1dSHQ3YXoi4kK0RSMxlpd1+CT1Arv4cxmtaThcqFENO5kMnV41mHco
	GlAiz87cujPDNyZQ7i76iwlUI/mX82MBBi/1s60jxXjomK4i3PqL77523MTCM8jjb7QcGXBrQU/q3
	yJlaYg0Qu24ui00zrv8KJlo1ALDNLwv4Ed58BNxBlYg2EDBhiIGamYVBOxTdnYIzvZVngVd8kU305
	jF6oyVCprd6AayQ+tEsaWnDopmaEGs/Br3aNbgn69zndyMMLwr0mGirmg7uAmCOGi1UxWmN1FND7m
	//aWbkrR7huGnJ2JNQoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqyEq-00ER9H-QE; Tue, 17 May 2022 14:31:52 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqyEh-00ER1f-JE
 for linux-mediatek@lists.infradead.org; Tue, 17 May 2022 14:31:45 +0000
Received: by mail-lj1-x231.google.com with SMTP id 16so21961157lju.13
 for <linux-mediatek@lists.infradead.org>; Tue, 17 May 2022 07:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/O66yZapi0BSSMqvuLDb5QljJcIprafeIHhXXNrM3HQ=;
 b=dPeUZnTqyPM8BGsOzR2Y+Vt6GWYdXlYfL5HGJ+hst8ZLbeLdCV6ulIEiqONwOKQcra
 TdpSy6uqP4eKoOYsGzQ82XN6kf8kNeNOt4h45xHODQi04EBKLRe3GQMdPGlL6GBCeZxX
 EddyM9xIYr6I+BLfuuv9u8reT0fIAFtJGV7+ja7H2ZE2syV/wgC2NHDjNIDGRY/hnwuD
 PY6/Q/WKOItv1ABnAyxYNLEFFIBOKCkcxT8jLoX0LEYxOp9mPgcxwdub5FuaocQ+m11O
 m7OD0Hu4p3qcZzvs4ErNx7rKHwLXAvNkSriouSucnP5hJKzgSjNpbARacbqJcth0dSOl
 6oNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/O66yZapi0BSSMqvuLDb5QljJcIprafeIHhXXNrM3HQ=;
 b=lhq3ZNq3OoYe3iHsmUhd9BNmyAkAe9l5P6GXcwdCoyH8opIl4YaC+wtD0Tv++nDS2V
 12Xa4q/SshVM+UMgmacRjwtaaE+vUerwPx1rYPA9ciFFd2hyuZ8Saq45jyc5yfH/gD4W
 IdyUqSEF/ExH8PLIerV8oj/ZCWmZ3Ut91gN6Z55g4Dz/qB8+FIhTcFZH0bZEY2lVDOmk
 +rniiitp79uZhqikkiL2JJebNLiQiXGhObdtd4AKS6CTCIw12Tz2fvvMoMsJE0A0STIr
 Vt7NQ6XOQrN+uIRlOygad+BUmp0AKYc0TQCQeb0jPr/QiLeB+9mJfTZyRfr6SrAeEDHu
 Av8w==
X-Gm-Message-State: AOAM531DcS/QqI/PgENBvdRQrQAQIzsF1YbcGjBaaNp5K1mc49bAR35N
 keZ9LdwfY6oVQUiFodQUBW5BOg==
X-Google-Smtp-Source: ABdhPJxxH/bRh33U48YhgwMI8fGJcxcks+r3F5hkC/o+Ksawa9rFxEQPN3vWjkiewjDkCSZZd5vnGA==
X-Received: by 2002:a2e:2a82:0:b0:253:b73f:fc31 with SMTP id
 q124-20020a2e2a82000000b00253b73ffc31mr2056434ljq.449.1652797900225; 
 Tue, 17 May 2022 07:31:40 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 q27-20020ac2511b000000b0047255d211a3sm1601359lfb.210.2022.05.17.07.31.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 07:31:39 -0700 (PDT)
Message-ID: <24965f6d-f146-0b44-481f-041a17256ee1@linaro.org>
Date: Tue, 17 May 2022 16:31:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 5/6] dt-bindings: arm: mt8192-clock: Remove unnecessary
 'items'
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 sboyd@kernel.org, chun-jie.chen@mediatek.com, rex-bc.chen@mediatek.com,
 wenst@chromium.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220517101514.21639-1-angelogioacchino.delregno@collabora.com>
 <20220517101514.21639-6-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220517101514.21639-6-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_073143_725961_45C45F21 
X-CRM114-Status: UNSURE (   7.78  )
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

On 17/05/2022 12:15, AngeloGioacchino Del Regno wrote:
> There's no need for 'items' when there's only one item.
> 
> Fixes: 4a803990aeb1 ("dt-bindings: ARM: Mediatek: Add new document bindings of MT8192 clock")

The same - no bugs to fix here and this can be squashed.


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
