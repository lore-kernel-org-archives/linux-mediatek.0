Return-Path: <SRS0=XjSu=FY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6AEDC4361B
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Dec 2020 08:36:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40E392395C
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Dec 2020 08:36:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40E392395C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CNR8D3W+4wPTXGnlP2kKl3xId8Ztqe12N47ZfDY1ZVM=; b=H2/3WKhm1sm/cWHEdVXCvM+Gx
	k0wbd3uy4lTwhHyjPI4mtN/m4+8OHCg+8t3zi7Qw0FY0VPQddqDweiZ0YFvXX5GjYMxgNSV0G0zuE
	kENV6Ro4GShRSuT5Eoxj7EfMlC3ZH6lVnyVrMTk8ZzeDtQGbQ5gd14Njys9OkBV/12SvGMu/p+Zld
	Vlw7Yk+UD94ZYSCxwtaLRDfILc3kIEnKfFNSDt/0sAwTnPGNMAZOUx/9vdT7b+cmOuMqEnjmcb7Vl
	uDn//IIaRvEMf4WCc6prpb/ZJrLv100HXMRG/5NLtxFKNeXCHp2NFVb2k9XlHAnn1PybXCQnaCjSR
	bgS+yC5eg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kquCn-0007Aa-R9; Sun, 20 Dec 2020 08:36:41 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kquCk-0007AG-Nq
 for linux-mediatek@lists.infradead.org; Sun, 20 Dec 2020 08:36:39 +0000
Received: by mail-il1-x135.google.com with SMTP id p5so6179611iln.8
 for <linux-mediatek@lists.infradead.org>; Sun, 20 Dec 2020 00:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VeTpENt6JQ8He7PxkHgDwT6tFX6J/wKrgI0Io1Fiukc=;
 b=S5ruBZqc8QVT+NDMsWF7fW9OqXQPEi/VjQY+AxQZE/SxLPM3YxEb2Xi0QxmN4GQ3/B
 s3C5589KmghTtUF2TYeTy83vThtoWQ5pSJduu6U4lV/dHaB1HejEtmcUaHK4RSA2auTW
 Oeyj7aldX2g9QEaZsfPNuxNOBsvh4+KI99jk97dQEiXQTSVya2+XJFdB0QQlbzVGigur
 DuwbufmmarRL+vn+Y5+aGT6sDLkbncFs8ldsV8djcHaRsShPoUlQzWnf1sK3Su1pBL2x
 rLMe6xG7oh5EnitoYk/WQneVtbwqTL9gcWGVGgzGM+CLVbZsbgD4A5C6NUmzjj3D7cVO
 PwhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VeTpENt6JQ8He7PxkHgDwT6tFX6J/wKrgI0Io1Fiukc=;
 b=G3UKgFt8eup0rYBo4P5W58Abp/FtAiXJEX9mOmFcTdapQw0ZBt6QFbGjhhEcrXN8E6
 YyMMYWASEXTE4Hy1JbAJAAMELsUr+xFU1N+O49WzYoQdBh27iuEbjKc0/F87EVZmL7Xe
 zxa61T5xwUtBO7tvr6mCwjc6gPYl/OkfGNYOt6mMBvqhJOJCDhsM1/4jVdkdYUtq5eSk
 g9mkENdTxt93QSB76CWSiqsDXwpALwopM51aqbq4y0th0uPtZMG4pIdf6VH0eMNfKbpJ
 o1UzQLpAsGjpJfdudAewL85Ex8KfuTPaaOI52f/bTnXmzkm9MudVGOTkfpEwsAV2+kh3
 GmIA==
X-Gm-Message-State: AOAM532Wr9u13qpQdroTv5S85qxgtf6WlN7kkaGqLP7bcMY6+jBSZ4nT
 MvjRpNWqH3cJs6xlVurTgzs/AWtXgUvG4yzmhCI=
X-Google-Smtp-Source: ABdhPJyfWlLXMSMxTroy7d2Dji3JTVuRmQwEgIf1TG1OiqpAzO7+cbeNFrn/5RKhoatAoI42k4Noh6nsN1XEVUaN3uw=
X-Received: by 2002:a92:c04f:: with SMTP id o15mr12213601ilf.31.1608453397161; 
 Sun, 20 Dec 2020 00:36:37 -0800 (PST)
MIME-Version: 1.0
References: <20201219162153.23126-1-dqfext@gmail.com>
 <20201219162601.GE3008889@lunn.ch>
 <47673b0d-1da8-d93e-8b56-995a651aa7fd@gmail.com>
 <20201219194831.5mjlmjfbcpggrh45@skbuf>
 <CALW65jYtW7EEnXuj2dGSDwYC=3sBLCP0Q9J=tMozkrP6W0gq0w@mail.gmail.com>
 <20201220074936.ic2mtta7ihg7n3or@skbuf>
In-Reply-To: <20201220074936.ic2mtta7ihg7n3or@skbuf>
From: DENG Qingfang <dqfext@gmail.com>
Date: Sun, 20 Dec 2020 16:36:27 +0800
Message-ID: <CALW65jY29uPMGuMCXHsPgf2n5nNPivxmkLWuP_0zO82OL8rZrA@mail.gmail.com>
Subject: Re: [RFC PATCH net-next] net: dsa: mt7530: rename MT7621 compatible
To: Vladimir Oltean <olteanv@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201220_033638_909702_6C776EE8 
X-CRM114-Status: UNSURE (   6.97  )
X-CRM114-Notice: Please train this message.
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>,
 Florian Fainelli <f.fainelli@gmail.com>, netdev <netdev@vger.kernel.org>,
 Sean Wang <sean.wang@mediatek.com>, Russell King <linux@armlinux.org.uk>,
 "David S . Miller" <davem@davemloft.net>,
 Rene van Dorst <opensource@vdorst.com>, Greg Ungerer <gerg@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Vivien Didelot <vivien.didelot@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Dec 20, 2020 at 3:49 PM Vladimir Oltean <olteanv@gmail.com> wrote:

> But still, what is at memory address 0x1e110000, if the switch is
> accessed over MDIO?

It's "Ethernet GMAC", handled by mtk_eth_soc.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
