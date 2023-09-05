Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23928C83F3E
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Sep 2023 11:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kV2u1LJ/AQQMdTka+tApDVxIh+Eo+L4Z4u7wlv+3woU=; b=gITuYb0teNshuBI1dDglJfeJGf
	fubnnXY7DbVeJgm/73oeNmUPRh5ynV4hd8tha0bfafsbKZ1C8eKQVwpJujdciOM/NxWHLyOxHCcE2
	AdHssNnVHBSGtKJBl+w7npatQB2nkTW87vycOFZsGJhVN+cAmwVihHPOns+VoBdFXvzh5s2FL+/61
	DDGCF8ek0nAnPmEpQk2MmXE35AdEeQKa8m01a0s9UX9qgccr9rAHE1g2mLzd83ISUjcuYePI3XIFA
	+N5BvQXKWG+3beRh+uPiWAyf8sug4MmuHNH0T6VcIec1YES1SKVg/KJVgSaFrCXr4tJdQli5hchra
	/Z/0N//w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdTs4-005sPe-37;
	Tue, 05 Sep 2023 11:05:24 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdTs1-005sOK-39;
	Tue, 05 Sep 2023 11:05:23 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9a6190af24aso361722066b.0;
        Tue, 05 Sep 2023 04:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693911914; x=1694516714; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kV2u1LJ/AQQMdTka+tApDVxIh+Eo+L4Z4u7wlv+3woU=;
        b=DmGOHFoC/l9N90KArPYLg43qfGZFkHfLZ2m2+sqO9w0YhJVgSh7nMzCQ4ktVFp3cyF
         VMM520epTAxArdmMo1I5/xjUznc8XLBk97THVLOXjnppf5+yWSyaZz5Tr7w69pNsbFCd
         769F+/iA3BezrUlJUhtnAGVojdS+i8bP3yYZNKYT3eERF7UrOzXCRkVZr2UEBUMZBhti
         bGNNAhhJW31JGz+nGndrmoxggbBu7WmsDFBOidg6rQ0/ER4L6bYBO0lpUFPqaXdYlhwb
         4akoWTb3/bY4xB4Yi4GgcMTcgdmpXxAuTC61pWENdFGBkr2ON0r31inoOCIgUnoWKxCE
         1E/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693911914; x=1694516714;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kV2u1LJ/AQQMdTka+tApDVxIh+Eo+L4Z4u7wlv+3woU=;
        b=J+lMF1ne9H+mYm775rQtBSETRRncTxYKNjq79VUwiZBSfG7FKCA9VxRqc+yWWQAYpz
         WSaj2hOIcV05CIsaujS8puMatTekxbxYNoPBluSiGZUaJVqAWY+lnC1LzGQ/804Vl7X/
         jhQFcjl+2Deyx5Og1h5YOUkX2kj1lb3oIy/Xf4x0kPxPi3lsUCcqRK6xH1Th9P97jJs7
         VFCKtl1yx4HGpoFcLV3UD6kDpclB2CbrRD/Jlt94unCoOzv+LjX3EqhmBjWXturGpsZK
         5JmmYcdcxRJtnFra8wQfVNiEnsduMpS32tpKelm4Mqa2WV2U1rQd5F5jMsAY0TALzTkI
         +RIA==
X-Gm-Message-State: AOJu0YzeBkdUM9pl+Gv+fyI+q8OkSw1wWH3l+YfhmjMEfUr6nW/rRqCK
	MTDfT6CxrgcDzRQCC2bQD40=
X-Google-Smtp-Source: AGHT+IGrI66p2CBlDOcMK2yKRkeShj590QUDA31D8xucis1MBr3Sx1jck3yAeoVNwtjgdsXFZ3lyyQ==
X-Received: by 2002:a17:906:1bb2:b0:9a6:69bf:fa5a with SMTP id r18-20020a1709061bb200b009a669bffa5amr2412702ejg.63.1693911914444;
        Tue, 05 Sep 2023 04:05:14 -0700 (PDT)
Received: from skbuf ([188.26.57.165])
        by smtp.gmail.com with ESMTPSA id t20-20020a1709063e5400b0099ccee57ac2sm7408438eji.194.2023.09.05.04.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 04:05:14 -0700 (PDT)
Date: Tue, 5 Sep 2023 14:05:11 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Cc: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Woojung Huh <woojung.huh@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/4] dt-bindings: net: dsa: document internal MDIO bus
Message-ID: <20230905110511.hyap7grnomzwqj6d@skbuf>
References: <47b61929-5c2d-4906-b153-2046a94858c8@arinc9.com>
 <20230813112026.ohsx6srbt2staxma@skbuf>
 <8a8e14f1-0493-4298-a2cc-6e7ae7929334@arinc9.com>
 <20230813190157.4y3zoro53qsz43pe@skbuf>
 <f5f468c1-b5a2-4336-b1d9-fd82da95b21d@arinc9.com>
 <20230814143601.mnpxtcm2zybnbvoh@skbuf>
 <0cee0928-74c9-4048-8cd8-70bfbfafd9b2@arinc9.com>
 <20230827121235.zog4c3ehu2cyd3jy@skbuf>
 <676d1a2b-6ffa-4aff-8bed-a749c373f5b3@arinc9.com>
 <CAJq09z6eghuHY+b2y-kGmjKnLiEEOABXGKhjnB-PxJ=-GtYD4w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJq09z6eghuHY+b2y-kGmjKnLiEEOABXGKhjnB-PxJ=-GtYD4w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_040522_018468_30726039 
X-CRM114-Status: GOOD (  15.08  )
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

On Mon, Sep 04, 2023 at 11:42:19PM -0300, Luiz Angelo Daros de Luca wrote:
> I submitted a small series of patches to unify that behavior between
> those two drivers:
> 
> https://lore.kernel.org/netdev/CAJq09z44SNGFkCi_BCpQ+3DuXhKfGVsMubRYE7AezJsGGOboVA@mail.gmail.com/
> (This is my answer to the series opening message to include the first
> paragraph ate by the editor)
> 
> There was some discussion but not NAC, ACK or RFC. It would have
> dropped some lines of code. I can revive it if there is interest.

There was no Ack or Nack from me because I didn't manage to understand
what bothers you if the unified dt-binding has a "compatible" string for
the "mdio" node, which the driver simply ignores.
https://lore.kernel.org/netdev/20220706152923.mhc7vw7xkr7xkot4@skbuf/

