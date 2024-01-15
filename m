Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E3DBC3DA79
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jan 2024 21:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=55NEIJBXCpIIIZWtPRCLfdLr/foh8lYBwfef4urHTYE=; b=u8i815A6xqhHgniA7vBtcJVgFu
	/+eRKmSrHpKinCLTEr5CcxWiuWg83O5OS8WNnnrtaHAbw249clCBQj2Q2SnQyexm16yVDmu6Lo5Fc
	rn92X0R4+knmqLo4oETNTcVPK98+CyvbG0garUCRhrAm8wSmEeo/PjDyv+aPQcfjc/r9KA+OLywLw
	X6nvr3R66GwEJG5C/Yff4H2ijEkWHNBrJam3Fh7JyOZHA2Ml6bChnKiF1WkuZEHNrKW+FTvZg86NR
	7Y2VMJeexLrwyHAJ6BqX0KlrBtCiwSe2CJvccMcU6drriPoIag2tP3I/27UC8Zs/bq29zKeJP0mY0
	AYmw8jXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPUjG-00AF0h-31;
	Mon, 15 Jan 2024 21:42:46 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPUjD-00AF0B-2h;
	Mon, 15 Jan 2024 21:42:45 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a28b1095064so1029431566b.2;
        Mon, 15 Jan 2024 13:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705354961; x=1705959761; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=55NEIJBXCpIIIZWtPRCLfdLr/foh8lYBwfef4urHTYE=;
        b=lr92D2bVPoSvz1Uh6FgEbjLQnXnHukR/Y5FGogE4vhA4dyDYmX9OXCbM3Srt1HirIQ
         uXcdlR0HelFF1K0WxxoBCU99kG5lrZF9YkUXEgHeT4OS8Uj1si7XTSk9ZDDcT1G1Ejom
         nUwteSkIe4icplV6E6ucADg8+mA4nhmvQnVeq52bIpSB2HbpFuf2NzPxVDNvI/UQhtiX
         7ALmbHznfpQZuh3u8fETUZ0bhQWw09DJtmsRzMv0UcCHIBYnW3O2LVKlKsw5p/P2Eiu/
         G7eHHE0ocWU96b2z3pzXDy/WbvF/mbPvLDmsrUBkMYj6YoZPn1A5c0WM4EwhHcvV8A95
         hvsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705354961; x=1705959761;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=55NEIJBXCpIIIZWtPRCLfdLr/foh8lYBwfef4urHTYE=;
        b=SzTwrKk7f8211efWDQMMVEbb4AhACYlVRyjOL5/QHmdoOJ7rfB7rL2uXiulaEuwcHZ
         1j6MuY5WhT+ehGadQ0io1k5hb/uj5hpCPEOYlaeIMOHExCYCbO1IGW6bImHiV0apZG8j
         adeG6lK/BrtvUQS7cadksgmup8zSzgobxWQRfV3p6Skm/UthfqElKNN2MV5Lc+mNIev1
         vwQyw3+6ZZkz+/DvP26gAub7Dbe0OOQX5aYdvZviNMLB3Vy8zpcXVMHzjSvFKesC5wmW
         dodgfHcvZdomBC6MNFp9lOaK/eWiCCoz6yFY/5bExeXaEPGuNPDYawW+CDmQAMr7sKnX
         f+4A==
X-Gm-Message-State: AOJu0Ywd1iHgPDhozLc2PcfQW5Vg2SJ/EwuVi9rQEuS/bI6bQcnt+MhW
	QUMhr+fpB/3uKoR2ti6SpxA=
X-Google-Smtp-Source: AGHT+IFVXESXnZ5hXNPi66V18lKI+85ApHMSsnxuhoou/MRvRXnGDbW8FPlG037wrslaHLypJx/8dQ==
X-Received: by 2002:a17:906:d044:b0:a28:1916:6cc9 with SMTP id bo4-20020a170906d04400b00a2819166cc9mr1609989ejb.270.1705354961355;
        Mon, 15 Jan 2024 13:42:41 -0800 (PST)
Received: from skbuf ([188.25.255.36])
        by smtp.gmail.com with ESMTPSA id kw7-20020a170907770700b00a29dcbe1e72sm5693853ejc.56.2024.01.15.13.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 13:42:41 -0800 (PST)
Date: Mon, 15 Jan 2024 23:42:38 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
	Luiz Angelo Daros de Luca <luizluca@gmail.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [RFC PATCH net-next 7/8] net: dsa: mt7530: correct port
 capabilities of MT7988
Message-ID: <20240115214238.bnlvomatududng6l@skbuf>
References: <20240113102529.80371-1-arinc.unal@arinc9.com>
 <20240113102529.80371-8-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240113102529.80371-8-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_134243_900677_736AB9C8 
X-CRM114-Status: GOOD (  11.38  )
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

On Sat, Jan 13, 2024 at 01:25:28PM +0300, Arınç ÜNAL wrote:
> On the switch on the MT7988 SoC, there are only 4 PHYs. That's port 0 to 3.
> Set the internal phy cases to '0 ... 3'.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Acked-by: Daniel Golle <daniel@makrotopia.org>
> ---

For this patch to be obviously correct, please make a statement in the
commit message about port 4. It doesn't exist at all?

