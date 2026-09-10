Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58DA9C79FB9
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2026 12:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=z96/yzgqxZwebx+1STswIi+Go/ctjBNtJnkegSe2jjQ=; b=j6cNWj4SH3WeKGx2QsvUs65+sD
	mW2zDL/ygZGOjg8OrbTe4UoOeS1PzVu1CauyTyWSJTQNT/Xs2M0hU6VTjG8eMkSS/cSvgrM3Obz/i
	e8Tm0I/0746vx88JHvprpkI4L7/baLiPsIiZBhrd3+8UKlNIIHlTCc9Cca1HjfWBZXfiL47BRkflR
	fjLxKkkN9VjSj0yUyJCvnRU/eV7IWF9i0U9tETmEwReYnhJyiusOJlQZ/AN8ZeTC7KEqlR28x6dwo
	oFRNFH3/zf4P8mRmo0plUnbTuFLFUggKX1Z3AyArOdFduXDxh/G/S5+PxrXUS6B5URWcQq7yhN9cL
	5clJCXSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4dcf-0000000EIwk-0tDj;
	Thu, 10 Sep 2026 12:11:21 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4dcb-0000000EIvW-0qF8
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Sep 2026 12:11:19 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-6b1c75f0049so5203765eaf.3
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Sep 2026 05:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789042276; x=1789647076; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z96/yzgqxZwebx+1STswIi+Go/ctjBNtJnkegSe2jjQ=;
        b=Zyvrn8WzMC6NZla/QgtjfZZfAemcSVasBHcdjM8U8UngbvP5pruTxjMn/n/7WEOpuR
         chcAC4nztqUMItaW20d17nyjfK8PeO+XbtwvdcuTpUfaSCejQmtCyZU1PO09foWlkeVL
         QgGqzJj8ZFLgmZQFTIR813rWIIowgZVVgUu+TpgwLSaXc9gSal/+6nESxa2aVgWBAGt9
         3cYOcIXcc3jFpJUsio7cn56yIQa7gMeKDnH+xyde8d78BK6ieikYy2apFbxPw23Csvnk
         L1Pwo0XAsMOo2VJTkivunLJxQEUU0sZuTwRVuc+wawl2lcKaY1xQoSd0onsp48GUzqPi
         QtGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789042276; x=1789647076;
        h=content-type:content-transfer-encoding:mime-version:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z96/yzgqxZwebx+1STswIi+Go/ctjBNtJnkegSe2jjQ=;
        b=dzTGLwdPBadlAoPVNgO7En6jW2CDd3f0tg3ab0e+9d0PNqXm6rCQ+W0CnMVxAIO3M+
         OgdRILUAljj3pw3hxwUpfIKy6/yPxgmud3BqjidY5Pcf8K+Q5PC7usAPliT1Ny6lZGvB
         wUb7rlvn6+Da1hX3SiJkatXDEWOVsv+b8RomJgxMBz49tPw20A2AbQPdjs/4ii0h8xBB
         PhQZeoHkJKMxfORw+5gARkrdowZDRRzgpGF7/DPjRaeBPcat56RuL2zDjymB5KZtBgKT
         XgPbLs/xvlkNjGG6o9LmIetN+lg2xtQoOJm5lNARg4+0BJ039Fbqj3odJGfLr9sEp/2e
         7seA==
X-Forwarded-Encrypted: i=1; AKwUvBw8I7w/0TRdquWC98CCxOIHH329leTzIWvGDBpoVNFUEwEEaEIQ+VsoKBhi5I5JJUuygCkqpVuBHUiIH3LyQg==@lists.infradead.org
X-Gm-Message-State: AFuF++m6uyBrUC3giCKWO+Q3OIzT2dmtBPuxf0UvqPtoRcNQHpX4HZYN
	hNKb4nnHryaf+d/89wkaT1/wfOkt5NXNayhOsz5ZMHOoX8uHwYYZ3cU=
X-Gm-Gg: AYBFou0i8obnoHIYhJpO/nvq++ZGU0+eLQHNQX8+JgeuLkc/RHuYXwcxe6QmF+Y+dfx
	gW+AC2S2o1CltZg0lC5Kivu2V4OGBe55yF2gDBVhanTYXWwhcM7gZynu+It64xld1zBOxaXLzMh
	ACtU5K4XMzJvQKgUMALzoMMrsc0zrmQYqHwMrwEX4pIzum+tE8mJ8mwOkPKdUURd0wER5CELbCr
	+7kigsi8npbgs8F1IscvVbfk5mij3ZDIhmrK0tgLJ747duaucaQcCvTsd7GcooxaYkNUC4HJjrL
	YxwPDAeGGCrAkLHSxFgE7yHbM/2hbxGbZOHLhbrt4y4smBWJdHEaUAVdNE7x3ejElRj1Vx/uhCj
	ZRMgaJeUXYcarIeTIlJ9rJe7H4x0H6WlVFLuNa4WIfMYWUsO2MLjl9KWbaIdKYNdB35z2j8LZsG
	n63UnAFpEmuedzbg3A0B+4LnbOr72e41Nb9feHMSLkc1/P824nkxG5TBb5nlIeQRFNfGTolBF0d
	Y8HSumgi5JDY8/wJhc5/L8jEgdZWzKu4VtLvXPlLljWvM6o
X-Received: by 2002:a4a:e84a:0:b0:6b1:4a71:775a with SMTP id 006d021491bc7-6b6fcbde97emr22252414eaf.19.1789042276189;
        Thu, 10 Sep 2026 05:11:16 -0700 (PDT)
Received: from matheus-note.localnet ([2804:7f0:84b3:2201:fb27:8354:17d:2bcc])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bbf1feesm53156354eec.26.2026.09.10.05.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:11:15 -0700 (PDT)
From: Matheus Sampaio Queiroga <srherobrine20@gmail.com>
To: andrew@lunn.ch
Cc: 25181214217@stu.xidian.edu.cn, andrew+netdev@lunn.ch,
 angelogioacchino.delregno@collabora.com, b.larsson@gmx.com, cjd@cjdns.fr,
 conor+dt@kernel.org, davem@davemloft.net, devicetree@vger.kernel.org,
 dong100@mucse.com, edumazet@google.com, enelsonmoore@gmail.com,
 han.junyang@zte.com.cn, hkallweit1@gmail.com, jes@trained-monkey.org,
 krzk+dt@kernel.org, kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, maxime.chevallier@bootlin.com, naseefkm@gmail.com,
 netdev@vger.kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com,
 robh@kernel.org, vadim.fedorenko@linux.dev, wangruikang@iscas.ac.cn,
 xuanzhuo@linux.alibaba.com
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: econet: add EN751221 ethernet
Date: Thu, 10 Sep 2026 09:11:01 -0300
Message-ID: <0bwM5hNxQhuX7GLiig7ffg@gmail.com>
In-Reply-To: <a9eac625-f0f3-47db-ac2c-26c7df66f52a@lunn.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_051118_364427_5870CDB6 
X-CRM114-Status: UNSURE (   8.23  )
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

> That is a very unusual phy-mode. Is there a reason this is used in the
> example?
>
> 	Andrew

the GDM1 and GDM2 behave something similar to the newer Airoha, we have an MT7530 connected to the GDM1 as internal mode, and the GDM2 is also an internal one that communicates with the xPON and xDSL subsystem.

the en751221 has two mt7530 switches, the dsa0 limited to 10/100Mbps and a dsa2 1GbE connected to port 5 of the dsa1 in cascaded mode, but it varies from chip to chip



