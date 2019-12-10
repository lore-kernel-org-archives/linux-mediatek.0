Return-Path: <SRS0=F6Lp=2A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C4ECC43603
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2019 17:05:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D62B02073D
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2019 17:05:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cwgrr69c";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="urIFH+zO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D62B02073D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IA6U10fNZvk7GxYBNLPRF9EYO9Zb3E2nxF+/Z+8AP4s=; b=cwgrr69cN8GCbx
	48KbpHMNc+gD8vZWaX06wPg66tO5p5HwEymIoydaoctUqXHO1eJqmyw+OT+PbdAtKZQ+l4LNvdMkp
	VmsHL3kWsuEenKulRrWom2bYBiaDgORTkma/shN/h+RxIW4M1uA8eHZD/wAmc5LS16qngUJQjO5Vt
	A6IY4+TPXRE/qntpTWBFcwKh3Xn1SrgHZckT/jOMcdAoQgzLiv59TdoAMb3mdZe2lnnS/Wz/+qrO2
	EVUu0jPEUj9lGKq8EhNl/NVMJP6fppwBEv0IJA6vv3NQmij8ag6sWAMCckZDUO4HI69bP/px7Iw6T
	ZPkhkr+e4CTbIpn2OUvg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieiwu-0006fT-Ix; Tue, 10 Dec 2019 17:05:24 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieiws-0006f1-9p
 for linux-mediatek@lists.infradead.org; Tue, 10 Dec 2019 17:05:23 +0000
Received: by mail-ed1-x541.google.com with SMTP id cx19so16650009edb.1
 for <linux-mediatek@lists.infradead.org>; Tue, 10 Dec 2019 09:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V/m7GvYpg3asIPZhHfNwzAdY+b/5CfIU9R9Z7IpYwiU=;
 b=urIFH+zO4UZfF2rCurnwpzVDpFNMAqb2rWMAIdXu58p8ugm6svnzZ31UqKn+Rtbu5e
 PQsO/BsQcZt/HKR9Hv4vG658oKEceiGQQVzZQcDCEEuiMdWZbPa8u31fvChGoYyihI6Y
 sl5fkWptMuptcHYYYeXRZneQVLiNZmRg52kmHZy2nFsGvceMwwa1MKoOeZ7HkVSFiCzK
 nuD7lyyY/3F2R8aVkID44KN0loAp/QQCgWhn4yFIKm+V7Jbnun8WnKWqmVo4Ntm+41Z5
 P+iwzzCI7ibvAAnmmMzUWCsPVXjIo3en5FfaJIT/ttoJaq9exR3GPS32l+UhFoQca0lg
 2mTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V/m7GvYpg3asIPZhHfNwzAdY+b/5CfIU9R9Z7IpYwiU=;
 b=EYdHUnLcRWpUz5nMfcdZLYglrnisC2/Mmq18cM0HekGwB8HKquz1eN+AnrGeMNmDPK
 NCsu53ldzTkQLFnpRiHIr7uTitmbgFRHkVJI/mioosFjbu5tCq/R83N30ECtKwy1uVZN
 QcAplssI0nr8b1KjK85WqhOA6uDOGNDBFyUEfkWMwI9M54hyLoGFdAMiMq5yZ9Z6vE17
 wCKaRYgzbOGAIpnJv359T+FiHeGGJUP8QGYVBq/Gxut3dY/IOaP9vidj4mRP1Euh518U
 G+xY6dTqiJSOQZanMS+TzRz+uqHoKEk5BnT9UfJl1R0/BpDjiQ+SJWaS/80YAU5e15Y+
 Ef+A==
X-Gm-Message-State: APjAAAV6X0iM42h2s3a3W9TMkouY7KWEqdGb0/J9jA6KR0NYGPQu5+lH
 BkVaYhE/gPpMJjH63kyXKrZyAiRsdGh79Mm0Ufc=
X-Google-Smtp-Source: APXvYqzyHbVIEY/8yAXTbmWOCmJY+Np2u+GYL67HEkNJeOc5mAbpPhpBS37Z+eeJdlRiZHSgZ7qlEoQyRL9kKTMTrHc=
X-Received: by 2002:a17:907:11cc:: with SMTP id
 va12mr4844106ejb.164.1575997520215; 
 Tue, 10 Dec 2019 09:05:20 -0800 (PST)
MIME-Version: 1.0
References: <cover.1575914275.git.landen.chao@mediatek.com>
 <6d608dd024edc90b09ba4fe35417b693847f973c.1575914275.git.landen.chao@mediatek.com>
 <20191210163557.GC27714@lunn.ch>
In-Reply-To: <20191210163557.GC27714@lunn.ch>
From: Vladimir Oltean <olteanv@gmail.com>
Date: Tue, 10 Dec 2019 19:05:08 +0200
Message-ID: <CA+h21hp12UGQ04W4rDo2PdFa2_5oMmX05KKUecdz5-+hv-JqAA@mail.gmail.com>
Subject: Re: [PATCH net-next 4/6] net: dsa: mt7530: Add the support of MT7531
 switch
To: Andrew Lunn <andrew@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_090522_342849_623283F0 
X-CRM114-Status: GOOD (  11.37  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Landen Chao <landen.chao@mediatek.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vivien Didelot <vivien.didelot@savoirfairelinux.com>,
 netdev <netdev@vger.kernel.org>, sean.wang@mediatek.com,
 lkml <linux-kernel@vger.kernel.org>, frank-w@public-files.de,
 =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Landen, Andrew,

On Tue, 10 Dec 2019 at 18:36, Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Tue, Dec 10, 2019 at 04:14:40PM +0800, Landen Chao wrote:
> > Add new support for MT7531:
> >
> > MT7531 is the next generation of MT7530. It is also a 7-ports switch with
> > 5 giga embedded phys, 2 cpu ports, and the same MAC logic of MT7530. Cpu
> > port 6 only supports HSGMII interface. Cpu port 5 supports either RGMII
> > or HSGMII in different HW sku.
>
> Hi Landen
>
> Looking at the code, you seem to treat HSGMII as 2500Base-X. Is this
> correct? Or is it SGMII over clocked to 2.5Gbps?
>
>          Andrew

I think the better question is: what is being understood by HSGMII?
What does the AN base page look like? Do you support AN with the 2500
baud speed? Do you support AN with lower speeds? Do you support lower
speeds at all? What PHYs do you interoperate with in this mode? If you
don't support AN, then what's so SGMII about it? And for that matter,
if you don't support AN, what's so 2500Base-X (802.3z) about it? I see
you unconditionally force the speed and disable AN in this mode. Do
you have any reference for what SerDes protocol your hardware
implements in this mode?

Thanks,
-Vladimir

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
