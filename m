Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1896C38142
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Jan 2023 13:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5LAlV4rwXGaZAkBT5gd6JtG7tn12Ct026ebSvrWPbW4=; b=09lbBdpsX4D8r7dvsMVRf3TaOD
	/6XrwCsN4id8s9ZNfW9hszfjTuEAUqpFe4tmXFxMNwGQPin+3Qt+vvk8VPS1q5FpkK/UzIsxPlG8U
	1ebBL+CTmN9LnhueX4q1PmQlo5u4Dnr9AXx1HkSjJeZ5XP9AtLWzx7DZbmc0SXT/nqzrA71pm9Gkz
	Zlq8OfDn/7WtzRvec9rICvbDUHdU7t1CNhOWphQvPcFTRHDBmt734AvoDvRMJBuC0Wr3XCOwikhhn
	6gi4a0U175hq4/0rQsCuQDR6XAe5JTiZPaCdJy14H74ZpEQt5wQ/eD5ToPRNxKtsAzVAfVU4NgYSP
	o0aoL7fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMqGG-007wO9-T8; Tue, 31 Jan 2023 13:01:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMqGC-007wMf-ND
	for linux-mediatek@lists.infradead.org; Tue, 31 Jan 2023 13:01:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675170075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5LAlV4rwXGaZAkBT5gd6JtG7tn12Ct026ebSvrWPbW4=;
	b=i/VxNSx5ymA9Zv4R88sZv/gMjq2X2oGZpINcCeSg6uzzjS+/xF9mw7yt8UZa7Fk4UsGwZH
	c6g+zfgzWglP2SqmfXxIx1MFq79S2U6QWLYCppjIadcgHs/7854fyOT5AS/yRjxKRpnHAb
	PdJzwyAmU1gPmFzg6rJ2CSzxW6uoZQA=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-422-ZpgabItFOF6C1xNXAySSig-1; Tue, 31 Jan 2023 08:00:59 -0500
X-MC-Unique: ZpgabItFOF6C1xNXAySSig-1
Received: by mail-oi1-f200.google.com with SMTP id bi31-20020a056808189f00b0037804b06dd1so4146132oib.20
        for <linux-mediatek@lists.infradead.org>; Tue, 31 Jan 2023 05:00:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5LAlV4rwXGaZAkBT5gd6JtG7tn12Ct026ebSvrWPbW4=;
        b=QADScbZ7fIsF2PBCeqU8I5xylet3Uq1AuimBC0VveriGmjcsGttf6uwPwzI2XTBG4b
         1ESSK4Wz1zoHcHt/klPhIZSYLII0+ZGG44SyBnQ2I8GDthzlt/GdSPRP2yT95PboF2HE
         ls4Be1oMiuHbW9eA5DgNuI0ydJICwDNyG9FApH9Yw9Hj3p/Hy5YmQS6Ngvxf4B4axjfF
         Sewxu3PPoroQlGlPID3pSvkVsfKvobj8++awBKlVGzX6xFtM8waVKgn5Miqo7cfZlOCL
         09Wog+5lglWUXKvz8Vxz+QP8iMcx4TzFAAGsFtcXCSc95sOiK3bV0rTTpAPZTY1d/8Xf
         w0Nw==
X-Gm-Message-State: AO0yUKWjkZm2fl1oN1umy4tyfy2khXZI7JgJju84ennJ2D8S0FOd8m+y
	kyC8UEWsJ/EbuzqrOvPMa4pfUq/d+vRh/uqhmS1hdNsK/iCQ9T+pblxWE3EzTidLlECotqjKAQu
	TpjofUmjK8a3sJZC019z6Tpe5TQvpEImE
X-Received: by 2002:a05:6870:ebc3:b0:163:758d:a6b7 with SMTP id cr3-20020a056870ebc300b00163758da6b7mr2880293oab.1.1675170048987;
        Tue, 31 Jan 2023 05:00:48 -0800 (PST)
X-Google-Smtp-Source: AK7set/3EcOyUfREamMpigitPUuOxl0q6+e2Sf3auXXnXQriycKTacCv8kCcq1zOOtoetgGsmXZm4Q==
X-Received: by 2002:a05:6870:ebc3:b0:163:758d:a6b7 with SMTP id cr3-20020a056870ebc300b00163758da6b7mr2880278oab.1.1675170048723;
        Tue, 31 Jan 2023 05:00:48 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-113-28.dyn.eolo.it. [146.241.113.28])
        by smtp.gmail.com with ESMTPSA id dy31-20020a05620a60df00b0070531c5d655sm9925169qkb.90.2023.01.31.05.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 05:00:48 -0800 (PST)
Message-ID: <f753ad2b0c19e085867698f7bbbe37f6d172772e.camel@redhat.com>
Subject: Re: [PATCH net] net: ethernet: mtk_eth_soc: disable hardware DSA
 untagging for second MAC
From: Paolo Abeni <pabeni@redhat.com>
To: arinc9.unal@gmail.com, Felix Fietkau <nbd@nbd.name>, John Crispin
 <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, Mark Lee
 <Mark-MC.Lee@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>,  Matthias Brugger <matthias.bgg@gmail.com>
Cc: =?UTF-8?Q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>, 
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	erkin.bozoglu@xeront.com
Date: Tue, 31 Jan 2023 14:00:43 +0100
In-Reply-To: <20230128094232.2451947-1-arinc.unal@arinc9.com>
References: <20230128094232.2451947-1-arinc.unal@arinc9.com>
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_050116_848286_8933B861 
X-CRM114-Status: GOOD (  15.02  )
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

On Sat, 2023-01-28 at 12:42 +0300, arinc9.unal@gmail.com wrote:
> From: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
>=20
> According to my tests on MT7621AT and MT7623NI SoCs, hardware DSA untaggi=
ng
> won't work on the second MAC. Therefore, disable this feature when the
> second MAC of the MT7621 and MT7623 SoCs is being used.
>=20
> Fixes: 2d7605a72906 ("net: ethernet: mtk_eth_soc: enable hardware DSA unt=
agging")
> Link: https://lore.kernel.org/netdev/6249fc14-b38a-c770-36b4-5af6d41c21d3=
@arinc9.com/
> Tested-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> ---
>=20
> Final send which should end up on the list. I tested this with Felix's
> upcoming patch series. This fix is still needed on top of it.
>=20
> https://lore.kernel.org/netdev/20221230073145.53386-1-nbd@nbd.name/
>=20
> The MTK_GMAC1_TRGMII capability is only on the MT7621 and MT7623 SoCs whi=
ch
> I see this problem on. I'm new to coding so I took an educated guess from
> the use of MTK_NETSYS_V2 to disable this feature altogether for MT7986 So=
C.

Keeping this one a little more on pw. It would be great is someone else
could validate the above on the relevant H/W.

Thanks,

Paolo


