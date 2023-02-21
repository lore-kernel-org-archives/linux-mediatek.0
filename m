Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61384C61DA3
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 09:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=alEius1H4Y8w76WB7xmYU0Ggwjx3hA9AGAhRmkeiUTc=; b=Vkx7frwdo+I5QPlxD92E1gb5Cl
	nGlwK4BrIAsysntSyODhhBt/U24ShMaDDXg0OfBO+XA0ImBTpEbJHwFYIYtCiXBazys+rThaF+lEo
	wsgF/cmSRpW8CoyZQSHlUc/6yhz/byxjfHv6iBfx1w0syvqRL6XWmzQbrXkgM4Z7pzrOVPnA9+FiH
	CzZVpFSUhvy1WFUgPNcRxL5l7XGJt+sydChDHQ8muq76oUsZerQPJ1q2njcQzcTwUBOuG/0+Zv7EK
	3TS+mTvUtvhCdX9nMHA3CoEJcqMkBy0ZA0YCYrR4sDugD8RgLwO7kN+TLlIdn9JLq6nuqqLYi2YA8
	DNyfgUVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUOWT-0077Av-O8; Tue, 21 Feb 2023 09:01:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUOWJ-00778S-Kc
	for linux-mediatek@lists.infradead.org; Tue, 21 Feb 2023 09:01:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676970066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=alEius1H4Y8w76WB7xmYU0Ggwjx3hA9AGAhRmkeiUTc=;
	b=Lvurwr4AA2r3yhQTBDJyF/tPEk223Sg6c0BxK3/ROiD9jhQSVgWghhVv0Ci+MomcSNqXdS
	tOBQUZqbppoNLQYmqTWKQVfNiI3OVS2W942a+RLqO/AClmVPpCpCxpI4RndimvGfNMJbnT
	b25bi09lBS1vu/Ogx86pUxrgfYc8joA=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-365-v72fB8UJOteJe5q_xlGNww-1; Tue, 21 Feb 2023 04:01:03 -0500
X-MC-Unique: v72fB8UJOteJe5q_xlGNww-1
Received: by mail-qt1-f198.google.com with SMTP id k19-20020ac86053000000b003bd0d4e3a50so1420948qtm.9
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Feb 2023 01:01:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676970062;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=alEius1H4Y8w76WB7xmYU0Ggwjx3hA9AGAhRmkeiUTc=;
        b=MxW5kHmwv+7eBDlELQRfYuDJg2JwRgq9qto+hMZ327zchkvUSJtugktafKmp9kMtCg
         VWBfTbAQuS5OkyR8t3GHwKglmbdsbmoBEnUo1SuoD+F68BsjVwEuhJqjT7nzsb7pEn3N
         hrGhTIUUVYgI7mnvipp2iNJBAKfSNj275lHnpc4+U1iccAtyAlYJrqjNwpQ/xExKDWG8
         sTStyOYkFr2L8lDBmQnWY6YKxkBP/iZ1VgPFoKA3+f8ZKwBo147LTKezeZfzTrQPNfka
         SOFqSlo4DNVD7kjgPsGbRnBDDXxkKgYywYtWovdkDbX9OYnG0s8vfmhb01l4BExgJTtw
         IqZw==
X-Gm-Message-State: AO0yUKXzJkQtQogF1jZBU//ssr5HwnWYJMokLEtosBbQTKZQWEQkduTL
	utOamL3NNiV2RyhWC/U0AK8y88y6DrTnNZX5Qo4sXP8SmoFrJv8jWU04R3j/uQohoZ5UbvmMjET
	EiwgYte89WjTqukc7C1WdAAZ9SRmM/+I1
X-Received: by 2002:a0c:f2ce:0:b0:56e:b6f0:e102 with SMTP id c14-20020a0cf2ce000000b0056eb6f0e102mr5321087qvm.0.1676970062647;
        Tue, 21 Feb 2023 01:01:02 -0800 (PST)
X-Google-Smtp-Source: AK7set9bNxSgvAs/GHzQpOohJLTvtYH+L3tWy9vURFBZyZVmzfwSmBF/kXeV3JS4/e2m+VqWWWGB3w==
X-Received: by 2002:a0c:f2ce:0:b0:56e:b6f0:e102 with SMTP id c14-20020a0cf2ce000000b0056eb6f0e102mr5321046qvm.0.1676970062276;
        Tue, 21 Feb 2023 01:01:02 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-121-8.dyn.eolo.it. [146.241.121.8])
        by smtp.gmail.com with ESMTPSA id z131-20020a376589000000b007186c9e167esm2077680qkb.52.2023.02.21.01.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 01:01:01 -0800 (PST)
Message-ID: <e9269e140d0027534e91368475155d83ccbe66fb.camel@redhat.com>
Subject: Re: [PATCH] dt-bindings: net: dsa: mediatek,mt7530: change some
 descriptions to literal
From: Paolo Abeni <pabeni@redhat.com>
To: arinc9.unal@gmail.com, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli
 <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Landen Chao
 <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Sean Wang
 <sean.wang@mediatek.com>
Cc: =?UTF-8?Q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,  erkin.bozoglu@xeront.com
Date: Tue, 21 Feb 2023 10:00:56 +0100
In-Reply-To: <20230218072348.13089-1-arinc.unal@arinc9.com>
References: <20230218072348.13089-1-arinc.unal@arinc9.com>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_010107_750855_8EBC75B3 
X-CRM114-Status: GOOD (  10.88  )
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

On Sat, 2023-02-18 at 10:23 +0300, arinc9.unal@gmail.com wrote:
> From: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
>=20
> The line endings must be preserved on gpio-controller, io-supply, and
> reset-gpios properties to look proper when the YAML file is parsed.
>=20
> Currently it's interpreted as a single line when parsed. Change the style
> of the description of these properties to literal style to preserve the
> line endings.
>=20
> Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>

# Form letter - net-next is closed

The merge window for v6.3 has begun and therefore net-next is closed
for new drivers, features, code refactoring and optimizations.
We are currently accepting bug fixes only.

Please repost when net-next reopens after Mar 6th.

RFC patches sent for review only are obviously welcome at any time.


