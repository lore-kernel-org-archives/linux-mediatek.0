Return-Path: <SRS0=SHoq=2V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEF96C2D0C2
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Dec 2019 15:32:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F7A6205ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Dec 2019 15:32:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aGD3A54i";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SoKkx8lK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F7A6205ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aujkqdtFH6m4xJ713KFgydTDVedLGGwSLRWQpbV+SlM=; b=aGD3A54iohnrWM
	QX00PQ10rj2wq1EdiVbJ0Y3wnNfQ+uW2qOJ0aOcRt/zBlmVi6HSh6OpMZsIcFOz1cH2q/t9vKgTDo
	xBx2PXzyd6Icb04yZtyL0Si+aQz64XG/iYMBAi7djDQCteAGINMEZNf2On/w/FuFluG6x6kkQk1dI
	81mqPcgGWvmJUcW3nesM7jO7fTvv4IbjW7KqrVSoVOHuKeSo1+0LXCWkejRBVNXsibKaWH5B0XtQD
	VDxLIc6Nudvk0IivM5Vf+cIU0OCNTsSsVv4ZI54n/WYHiwSORrsDxo0a840ieVVPfpBriT9fOTETB
	r6PQrWuU3+8yTTYifoyw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1imJVm-0005aO-NM; Tue, 31 Dec 2019 15:32:46 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1imJVc-0005Sk-OZ; Tue, 31 Dec 2019 15:32:38 +0000
Received: by mail-ed1-x544.google.com with SMTP id v28so35434452edw.12;
 Tue, 31 Dec 2019 07:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q46sgyzFCoqZCnDvkjuU+q1N3qAm1ojvKT53GL9XfFI=;
 b=SoKkx8lK10byoSOJpNl6uxfWB0HCqCbEDA9WDSUAIPDUly7zMzwsXjtIEwtX/NQsCK
 gwsPrha6BEhiaEHw9jJhuUdkaploQVhAy2ln5ukw12SKqh/hOV6c8BNpzDbWMzI/9C57
 /6V8tgzMmn8dJgRwUc/rzm4bOBA39qrDTi/FWW2UrdLTUSrvPrCeFuyx7doV2ZCeitwz
 5f1B5ynkAz/M2pBJb3kjL36uhtXjFDmrGrpuEdu7hTfoMX1S8wYpSDsYdsE/Hp8uHLWH
 8rNBYs7V074V++WTh89g/4y4wHW7RQX7AqeqeJvI6TBM7fMu2rB1eAA2w9fIwFdAeZnw
 gx5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q46sgyzFCoqZCnDvkjuU+q1N3qAm1ojvKT53GL9XfFI=;
 b=g2fOeyWvT29xBEvwO96Rj472Rd3VPbCVj1GiIKlbQMbXY+BEcPX+Zx/sdz17TiVPCx
 YQyAwHbj2UHPka6TzhfrLegrUr78ZHdaxaT9SUL/5rRcTrIjmDBX2uhFlb8WOKrWjFhs
 xBi4ABNdq0S09NvfLPZ/5tXZRc8IKhIymwDDYjjhHX9vE7luh8PGdrXCoHvpAUCpG0gr
 EvTWwlaPdhAvCYODHNdE1/KoWLbMRmFBFUEkMWn+JykP5JXyLguQ13Q4KIcDvgpjxNI5
 QRAaVCAXoJi423iquxfs61ws1SV6u/e8pybzPI7eLWuz8XvQ65JQOvC3v/mvUazGbhl9
 7TAg==
X-Gm-Message-State: APjAAAWcHMNzkkaSdY644nskXBRBq4Wj+QBx2i79t7kMlWOEWK6xqtcT
 fgLJk65BJjtPgFgpIpPNXKYfvyLpTK2QHa102ME=
X-Google-Smtp-Source: APXvYqzQloGOdbtCaSjT2mVsGVV5HxAwcWBjMQNtw4CkqOonMP0cX7iFD+FAOQl9Yi3PaCr71gLtv6WZ7zehEa70JJ8=
X-Received: by 2002:a17:906:19d0:: with SMTP id
 h16mr69858873ejd.70.1577806354952; 
 Tue, 31 Dec 2019 07:32:34 -0800 (PST)
MIME-Version: 1.0
References: <20191230143028.27313-1-alobakin@dlink.ru>
In-Reply-To: <20191230143028.27313-1-alobakin@dlink.ru>
From: Vladimir Oltean <olteanv@gmail.com>
Date: Tue, 31 Dec 2019 17:32:24 +0200
Message-ID: <CA+h21hq95SmS3BraUQeEytP+3Y7irmShBEwpXqqJv+xOp4ePrg@mail.gmail.com>
Subject: Re: [PATCH RFC net-next 00/20] net: dsa: add GRO support
To: Alexander Lobakin <alobakin@dlink.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191231_073236_800265_4106F7C9 
X-CRM114-Status: UNSURE (   8.26  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Song Liu <songliubraving@fb.com>,
 Jakub Kicinski <jakub.kicinski@netronome.com>,
 Yoshiki Komachi <komachi.yoshiki@gmail.com>,
 lkml <linux-kernel@vger.kernel.org>, Eric Dumazet <edumazet@google.com>,
 Stanislav Fomichev <sdf@google.com>, Matteo Croce <mcroce@redhat.com>,
 Edward Cree <ecree@solarflare.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Jakub Sitnicki <jakub@cloudflare.com>, Daniel Borkmann <daniel@iogearbox.net>,
 Paolo Abeni <pabeni@redhat.com>, Vivien Didelot <vivien.didelot@gmail.com>,
 Hauke Mehrtens <hauke@hauke-m.de>, Sean Wang <sean.wang@mediatek.com>,
 Jiri Pirko <jiri@mellanox.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, netdev <netdev@vger.kernel.org>,
 Paul Blakey <paulb@mellanox.com>,
 Stephen Hemminger <stephen@networkplumber.org>,
 "David S. Miller" <davem@davemloft.net>, Taehee Yoo <ap420073@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Alexander,

On Mon, 30 Dec 2019 at 16:31, Alexander Lobakin <alobakin@dlink.ru> wrote:
>
> I mark this as RFC, and there are the key questions for maintainers,
> developers, users etc.:
> - Do we need GRO support for DSA at all?
> - Which tagger protocols really need it and which don't?
> - Does this series bring any performance improvements on the
>   affected systems?

If these are these questions for maintainers, developers, users etc,
then what has determined you to make these changes?

Thanks,
-Vladimir

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
