Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D80E0C001B0
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Aug 2023 12:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rw/U1juJW++TN/CPqRVhgWO7e9qZoHR3vAiibGfwoUg=; b=VQOa7sAG+wjfJrgGeT8RAa69sl
	oewK/MN37uxSHIiVpBimRPtvmNn8M6J8lTnwaZLUZeVmKJ3iQTIvJH8WF6GSyxAdibTzzL/miEv7l
	IrkP/o7uIdsGCSYkYP+UDLtiqMyGblsXvnjVkq2F5H/xQdaW6uRcEmR6/2ctVWQjx5ydGnoLbQDWk
	gkBO0G5PR0JmnHDY2FkJi1xjrep9xSvAp7jH0YDyaSydM+QD8gv71+7rHgY1rft7B5afYpZ8j8E6w
	tCIBm+xnwtY5y6cvQiVEjG58fu6DQrEPgwPx9j0sPXsvteD1jpirvPcZ73ZF9NwuqxPPi5mIWWg8i
	JFKLSeLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTLeI-002XwX-2I;
	Tue, 08 Aug 2023 12:17:18 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTLeF-002XvJ-1V;
	Tue, 08 Aug 2023 12:17:16 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-99bfcf4c814so823041866b.0;
        Tue, 08 Aug 2023 05:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691497030; x=1692101830;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rw/U1juJW++TN/CPqRVhgWO7e9qZoHR3vAiibGfwoUg=;
        b=TuhI3HeU3OR84IMBS58tY9SllJeKkPGNG5JIO8YHu3HqodzIP3QxpHl8hI959AFLQO
         We42UvEm0IOiNgW+Fc/xlQFL4KdfZXXkByathq3Zalho7+nPp+bNDuMvzKqUGB7PmPM7
         gFA6/7V1LAnZSYquWvK9WaihSYY3+yAfbuMUOdt6+cWg6jcSiZOiDtONjgyReqsIeE9C
         gD2FHC2PY+05VjwM4voZzLtHbp4mLJex6kdrmFgLyi6ZAMRessAIhOiKFcq82FMrC8uS
         wniqExTUr6fgtoOwqEcu59/UMLMIpM3VT8sEU3yo2geCIEybgxkcmyZtCBkiVHGo+wts
         VB/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691497030; x=1692101830;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rw/U1juJW++TN/CPqRVhgWO7e9qZoHR3vAiibGfwoUg=;
        b=QNi6sStFjDnKZj/GrmgpmIopmVM0QhoDq+mG5ygAT+cn0vXDfPlWP5MjhWmZKIWcQf
         KJm+Ag5etUZE4uqGcTkUeY3vAeVYdnayz0fX7fkgR/jhKMhWOEM7RS0yJnvt+SyjqIJO
         ncMyDtI4Tu2FZwmcQCCCag/D90CNhyFNN8gjio8W2ILdSO3pX1W1Fn4XQ3Q/oG9UkxVU
         o7KlSFFtkU25DzK0kL44ktx5rdb3vXaSbUqrzuZAu6F0+RHHMp310WueFqJO557IL1ue
         L8t+Mbz7aHn3jOFQ0vWUuUtgnyVSzLQMGEbhtQXwMLO3e23OAIMkCPQ93BPjBmMpjcZ0
         6qYQ==
X-Gm-Message-State: AOJu0YxdjOAf9NPR8TGIBBaswIMIU1P77z9cY5o0YcYHTW8p7IfHPsac
	Bydp7xcV3Re8YBEcm+Dzr+0=
X-Google-Smtp-Source: AGHT+IFP72Tw+xIhBH3OCKy8dTwEFRVt0e08PihUpstVfcRZiD1229U4loKm3Rco7giOl8WkyfhNTA==
X-Received: by 2002:a17:907:2c77:b0:978:acec:36b1 with SMTP id ib23-20020a1709072c7700b00978acec36b1mr10450643ejc.17.1691497030223;
        Tue, 08 Aug 2023 05:17:10 -0700 (PDT)
Received: from skbuf ([188.27.184.201])
        by smtp.gmail.com with ESMTPSA id qo2-20020a170907212200b0099364d9f0e2sm6579767ejb.98.2023.08.08.05.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 05:17:09 -0700 (PDT)
Date: Tue, 8 Aug 2023 15:17:07 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Daniel Golle <daniel@makrotopia.org>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH RESEND net-next 2/2] dt-bindings: net: dsa:
 mediatek,mt7530: document MDIO-bus
Message-ID: <20230808121707.chona7hakapp6whe@skbuf>
References: <6eb1b7b8dbc3a4b14becad15f0707d4f624ee18b.1691246461.git.daniel@makrotopia.org>
 <9aec0fe0cb676b76132c388bb3ead46f596a6e6e.1691246461.git.daniel@makrotopia.org>
 <dcb981b9-b435-c0e5-8e47-d66add207fdc@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dcb981b9-b435-c0e5-8e47-d66add207fdc@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_051715_528020_00C07AF2 
X-CRM114-Status: GOOD (  13.54  )
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

On Sat, Aug 05, 2023 at 11:15:15PM +0300, Arınç ÜNAL wrote:
> I don't see a reason to resubmit this without addressing the requested
> change.
> 
> > > Wouldn't we just skip the whole issue by documenting the need for defining all PHYs
> > > used on the switch when defining the MDIO bus?
> > 
> > Good idea, please do that.
> 
> https://lore.kernel.org/netdev/0f501bb6-18a0-1713-b08c-6ad244c022ec@arinc9.com/
> 
> Arınç

Arınç, where do you see that comment being added? AFAIU, it is a
characteristic of the generic __of_mdiobus_register() code to set
mdio->phy_mask = ~0, and nothing specific to the mt7530.

