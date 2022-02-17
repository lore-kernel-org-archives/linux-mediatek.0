Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1CAFC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 03:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=He0/g/pEMXnQf1mx+HYpqIAZKBI6Jp3DWAesw3jRlEw=; b=yiu2d2vIp0bcXB
	Qnx+I5OCPnwboiATAHtXWzgU/zf/xtWO8gxjBSiIV8XhnrLDC858JCF287PgUbLW1dgaoA3uOSMrA
	+fCNe0SwR+ZVUJeDDHg9Pt8+rSJlBZkD6LU4x2V5bUOzoJqRoQ9xSlZekKR/vfUehklTgz1W0r/ER
	W+vdbZKdVgUUdZUDYS5N3bWsym4ppljkFHsBJ1uB8HTGg7iRyEyICZjyY0ZelACLYeC6x6MWaxTyE
	fNfCIKjg8rHBysxfx7zUAOPcId+6HwR2CtGf8g/uALiCNAc4wpDJCHfLKM6h4N+X9g53DsVFzU2H3
	XDNBL7px++Q4nGxnRKFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKX76-008oCS-AF; Thu, 17 Feb 2022 03:05:48 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKX6u-008o9u-AN; Thu, 17 Feb 2022 03:05:37 +0000
Received: by mail-pf1-x42c.google.com with SMTP id z16so3836423pfh.3;
 Wed, 16 Feb 2022 19:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eMoY/UclmOzHHpj7q9oQ/Af/xKLviGmGe8f60N9+gmY=;
 b=SNP965VUfhZXrVmh8kTvPSsUo8uMC1jyZXYcE//TNFlPTGHB9dXy4htdU3q6jLFr/h
 n/aaksqxMzXOFAPyNiluL1tEVo5gJbuBJAn7EbMdBfSMh252KspUFNvtuDIvgSSfIvf0
 6AZDUBq3v4fSDSO1sic7C7luXkosniXoMwvKe4FV7AUNHqdYjXOIdo96Y1EVvpdi+RLA
 HDdX9eDaVGNjmE/oUN7AxsVDQsfk18Gn9DOknMXwy0Q0Xv716a0sqITsqhxGQDgjxIzw
 j9rNWSGHzwWEix4lRiwo2f/OMZoGldMBq719xPT6ATBYzi733Ub75qC+1wTZQ6ORVqNV
 OR9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eMoY/UclmOzHHpj7q9oQ/Af/xKLviGmGe8f60N9+gmY=;
 b=i/T14M4RZXPKP8KWavGDbFW7Mh+pplcv6WBfXtp4uGOMrPYjLOXZxdluhj7eaPvsTA
 o+rkLX/0yKNrqiCqXp9JENOj5gMxb3RSs8FiXPh8yuCmxsiqNh9yG/66sRAZRODWJzcQ
 g0UyS2cI2gUTqqj9SLCY4Drok/2DZN0XKTTwkqDYtEX4Xl55wpG2jt7V4PL029YTHUWW
 RhDP4eHGuU01D0RDjZqghCdbRp+Szxns6NWTFkuar4n7jzO2HjRQXUUhXOdJBpUuQbIs
 +IB1HtPPitAffYBX+jvxc+aKCTjYZM1rGTmJ4e5+Vgf2Iw9GBu9gC/5A5wxiMO6TVB25
 PQzw==
X-Gm-Message-State: AOAM530Nn4DQUE/FI7yHC781jNp55bHtg3CONQS9SVWjPgUajhPb1PYy
 hFRPBkvA8lP1YQ0Zp62pvQ6AXtiGjon8QyCcmMI=
X-Google-Smtp-Source: ABdhPJyLApRn+E2RrFYRd8bcKZvA9EPDU6eRpSCfrj/S6z/9sjnhhHgWU+v18QjChCGhBycQ0aSbyDB3PvbmUV7j64U=
X-Received: by 2002:a05:6a00:1146:b0:4c9:ede0:725a with SMTP id
 b6-20020a056a00114600b004c9ede0725amr897542pfm.35.1645067118729; Wed, 16 Feb
 2022 19:05:18 -0800 (PST)
MIME-Version: 1.0
References: <20220216073055.22642-1-lina.wang@mediatek.com>
In-Reply-To: <20220216073055.22642-1-lina.wang@mediatek.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 16 Feb 2022 19:05:07 -0800
Message-ID: <CAADnVQK78PN8N6c6u_O2BAxdyXwH_HVYMV_x3oGgyfT50a6ymg@mail.gmail.com>
Subject: Re: [PATCH v3] net: fix wrong network header length
To: Lina Wang <lina.wang@mediatek.com>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Network Development <netdev@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-mediatek@lists.infradead.org, bpf <bpf@vger.kernel.org>,
 =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>, 
 Willem de Bruijn <willemb@google.com>, Eric Dumazet <edumazet@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_190536_369673_62646E7F 
X-CRM114-Status: UNSURE (   8.81  )
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

On Tue, Feb 15, 2022 at 11:37 PM Lina Wang <lina.wang@mediatek.com> wrote:
>
> When clatd starts with ebpf offloaing, and NETIF_F_GRO_FRAGLIST is enable,
> several skbs are gathered in skb_shinfo(skb)->frag_list. The first skb's
> ipv6 header will be changed to ipv4 after bpf_skb_proto_6_to_4,
> network_header\transport_header\mac_header have been updated as ipv4 acts,
> but other skbs in frag_list didnot update anything, just ipv6 packets.

Please add a test that demonstrates the issue and verifies the fix.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
