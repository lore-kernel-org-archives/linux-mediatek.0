Return-Path: <SRS0=AGTb=6W=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A83BC38A2A
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 May 2020 05:54:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C00220870
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 May 2020 05:54:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="brccmjKN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K1VwBxCB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C00220870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yRvFUPOm4iu8hbm9X4dkfCeEcYlu3Xo18LHl+UqNukw=; b=brccmjKNBg+fn3
	oC/ubnI//VIb7TrE67+lbJgsYIdmVl4smX16vcbuyKxg5IYDjk0DEwVBMINl02eOaxD6jspMkG08L
	/Fkd1A4nBvw2Vn0beyHnpdXbaklVHmGqH9+89MTDaWLuzYwChkte90kXClqSU9P+ibGiblB8LXvqw
	54PSBs570bRylEY2IbrTnaSe0Ba+KPmV0dhDzQouYsBqSr+pgOnKtiDdlsSGyW2Gq5S/G4O59lsk9
	QCyECwpSE6WW1EeL9yL9gW1FOwq4A3UGkgRwqZqKYSXCNCQW2k4/FsrEaG0y1JXkjCMQ3D8VWMQHK
	/u2cFdpp2vwpl/skdskQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWvy5-0002jO-Om; Fri, 08 May 2020 05:54:41 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWvy2-0002iX-Ge; Fri, 08 May 2020 05:54:39 +0000
Received: by mail-wm1-x341.google.com with SMTP id e26so8959616wmk.5;
 Thu, 07 May 2020 22:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cBuXlY0lPbTzvqFi3J9oIqLP+OF/m7YpRIj6GR1Gj+U=;
 b=K1VwBxCBXCfE4HZYWiqihZRJtx8ctP1mVKfq1o6aCJtu/K2DwQN6yjel0+96+k0mcG
 0uuiGrKz4zsQBMXrSSEoq364xNTJ0XfUyV8v85i/bpTYtVg9HOLeugf599IF0IqQbtQ0
 HFuvcYQomO1LBbkbc814Hmv+6PqZ8vuzbej4nEQDUqXoysFOc58ddm3QesuV+2jOOEki
 fJy7J3YgVTkYXJsIaZHg+NAtJmVDKvdUCxK1SIi+tER4fIclIQXInU9RVQAgG+SaECXp
 2NEaDBLaPWFmApTkZQjPaOAgRMoh6nbkR85XVuxIcheeDeBQLR48s6gZdmQ+i1xfKWoY
 EByg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cBuXlY0lPbTzvqFi3J9oIqLP+OF/m7YpRIj6GR1Gj+U=;
 b=IhHpSSNwfNCh6rXiaMipv/UBeJrwG+S9ucJgw/I7YLd2sCkj6tbu4/8WKYScMdl6QE
 KGWwE2aoJ6kUtNdsF2iK93asB4nIJhT/1Qrm43kyqkV9Xwx4EmiXFJEDCql2jTu1uxh9
 f/osiqOQRWBuMz05WlT5/JehcLpeGMzLapPhjineDsvZ1QJa2cDEanizRKBcTLAHdCwG
 60a+Ip6UHHLQ++DRdMA7fvZajHZR3YxlTyPofQJOeAqYlZIPyCjxmUOMPKUOn2RRlD4C
 0/pXro0bLBBXATPA875SY55Dfn375ISjD3CnLNUGiyxPyzBjHDAvy5OIPGdfw63NStHL
 oJuA==
X-Gm-Message-State: AGi0PuaDFqPWuLfun8fZbbUytLizXjt8cAma9HaRKRlOPSDqZIViaDrk
 VC9ikd2cB8X/NMwcRVfeTXwFcAJ0
X-Google-Smtp-Source: APiQypJN3BPfHFPyK3WDkQRQQXzBNgHR1dVgfWeEuUZhd4lAzK8YcVD4LeyB6dzQUvulSYABR4hCgg==
X-Received: by 2002:a1c:5f46:: with SMTP id t67mr15219360wmb.156.1588917274753; 
 Thu, 07 May 2020 22:54:34 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f28:5200:e838:acb:794:1ab9?
 (p200300EA8F285200E8380ACB07941AB9.dip0.t-ipconnect.de.
 [2003:ea:8f28:5200:e838:acb:794:1ab9])
 by smtp.googlemail.com with ESMTPSA id o6sm1177075wrw.63.2020.05.07.22.54.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 May 2020 22:54:34 -0700 (PDT)
Subject: Re: [PATCH 05/11] net: core: provide devm_register_netdev()
To: Jakub Kicinski <kuba@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20200505140231.16600-1-brgl@bgdev.pl>
 <20200505140231.16600-6-brgl@bgdev.pl>
 <20200505103105.1c8b0ce3@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <CAMRc=Mf0ipaeLKhHCZaq2YeZKzi=QBAse7bEz2hHxXN5OL=ptg@mail.gmail.com>
 <20200506101236.25a13609@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <CAMpxmJWckQdKvUGFDAJ1WMtD9WoGWmGe3kyKYhcfRT2nOB93xw@mail.gmail.com>
 <20200507095315.1154a1a6@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <CAMpxmJUEk3itZs4HujJOXUiL80kmEvGBvLF0NFc2UQoVDVTWRg@mail.gmail.com>
 <20200507155650.0c19229e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <c6e12eb6-d6ea-9ba9-4559-b2eda326601f@gmail.com>
Date: Fri, 8 May 2020 07:54:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200507155650.0c19229e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_225438_582527_72B79DDF 
X-CRM114-Status: GOOD (  12.63  )
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
Cc: devicetree <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 netdev <netdev@vger.kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Sean Wang <sean.wang@mediatek.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Fabien Parent <fparent@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 08.05.2020 00:56, Jakub Kicinski wrote:
> On Thu, 7 May 2020 19:03:44 +0200 Bartosz Golaszewski wrote:
>>> To implement Edwin's suggestion? Makes sense, but I'm no expert, let's
>>> also CC Heiner since he was asking about it last time.  
>>
>> Yes, because taking the last bit of priv_flags from net_device seems
>> to be more controversial but if net maintainers are fine with that I
>> can simply go with the current approach.
> 
> From my perspective what Edwin suggests makes sense. Apart from
> little use for the bit after probe, it also seems cleaner for devres 
> to be able to recognize managed objects based on its own state.
> 
What I was saying is that we should catch the case that a driver
author uses a device-managed register() w/o doing the same for the
alloc(). A core function should not assume that driver authors do
sane things only.
I don't have a strong preference how it should be done.
Considering what is being discussed, have a look at get_pci_dr() and
find_pci_dr(), they deal with managing which parts of the PCI
subsystem are device-managed.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
