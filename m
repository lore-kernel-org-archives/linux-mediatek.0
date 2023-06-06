Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA0EC7EE2C
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jun 2023 09:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NJ4Rlr1BwW/VlJIKDrxqTk8ExusP1b+351Bo/DAekLI=; b=SQALkqzrP/lfjh+1otRlV7CgeN
	36s5rRl11M5ZQP2iYjkTJFWvuFsDIEuayaFYSQX2QGbB3r3A5566/+kKFr1K/xZdaaz8MOWxuzPmf
	JBWEVd0awSwimRBz9OIt9rgbnjh4yjxxM0KGv/Op5rlPO9DB8V5isS+ddENXTDGke+Rz0xlwK0iJd
	HrMc0e9Nv2oPVH9AhUpHOZXz6RsSquoXPdSmaRZOh6Va9XbVk7VK/1/ihHm2y/ntlp83qVEz7g/vk
	CQ8PiAIVu9S5N48E4yA4RiA55kZi+WOZQtsJoSoKq1XQHxxct9J/p+bNwSyVRvJPsXc8jz2NeIrOx
	5GRjmoDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6SkU-000xXd-04;
	Tue, 06 Jun 2023 09:13:06 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6SkQ-000xVo-2j;
	Tue, 06 Jun 2023 09:13:04 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4f624daccd1so3089255e87.0;
        Tue, 06 Jun 2023 02:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686042779; x=1688634779;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NJ4Rlr1BwW/VlJIKDrxqTk8ExusP1b+351Bo/DAekLI=;
        b=rJCxYoqFxhnln+7uwfKhrIfVeudKadx6t+qWSNl/mO36w181J5vx75LfWV5i11vLFs
         bFP+a/t+PuKp8nlle+2pdSjfXhhXmTzfwi9fMz69Hp/s+kud9IjGZbBWjacaQPRa37sI
         jhOndXcXfrKpC7FphTyHg0sSzIKfsxC6yuK9J3DTGk96Ec177oUC5xocA138xe1ztiO0
         zlnuQk8oblN0AN22Kw41Y1ubN4pMbkXzIopu9zIVxoz+fRNQftLLQqEvb45Q5+ytxwFP
         Uey5DHh5UR7+F1rWtp0oabiNpu9RCA2sUe+Jf7rhD8GvtIHn+smy3Qo8xN03Uoqt4nSr
         y9iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686042779; x=1688634779;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NJ4Rlr1BwW/VlJIKDrxqTk8ExusP1b+351Bo/DAekLI=;
        b=kmP77GWw99XdJnAe78/jSy+N6cntr0AMZtEz6pSClngdFzCH73hZSFlrKQKm2HK7fu
         DIqUS/XMxiPwaWKfK4Hzur3zrILrJ1LSdEC/Imrdu+I45xbfAKKUQJ0GZDt9pLQhjsbu
         KoAahtdXLTuSuR33+cXD8SWF6dlAGhzaxjiEVldlxXZKVIoHuJlRpmQ168RMX8B+Oxkf
         QAY6nY7R6tzJ63gk73aZKHXTN9+k9Hoh4KojE/O/X+wNgttLg2jht7HaMRwQ0XAe04dD
         NGSnhSMars/ysdglXS6Sf/LTVQPF4e4OxIiPEoF+gGOdPj8JwPWFM5aAyWdOMftBb+v3
         Ud6w==
X-Gm-Message-State: AC+VfDxoC5Su1tY4E4n4vbdxtnWrDYwe2zhAhvECOV5tusONyvFAkzqA
	roSar27c8kMxZpW9/s9V7k4=
X-Google-Smtp-Source: ACHHUZ7NOlr9n+v7CD7+fCfytrUJRp+qlf8uQdrt9vuAMOBv8yz+ldjbrWuK96cVSTlsMrHia9ccFg==
X-Received: by 2002:ac2:5455:0:b0:4eb:18d:91de with SMTP id d21-20020ac25455000000b004eb018d91demr853152lfn.43.1686042779293;
        Tue, 06 Jun 2023 02:12:59 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info. [2001:470:26:54b:226:9eff:fe70:80c2])
        by smtp.gmail.com with ESMTPSA id a24-20020ac25218000000b004f6337508afsm203558lfl.222.2023.06.06.02.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 02:12:59 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
	by home.paul.comp (8.15.2/8.15.2/Debian-22) with ESMTP id 3569CslI011312;
	Tue, 6 Jun 2023 12:12:55 +0300
Received: (from paul@localhost)
	by home.paul.comp (8.15.2/8.15.2/Submit) id 3569CqTk011311;
	Tue, 6 Jun 2023 12:12:52 +0300
Date: Tue, 6 Jun 2023 12:12:51 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: Simon Horman <simon.horman@corigine.com>
Cc: linux-wireless@vger.kernel.org, Felix Fietkau <nbd@nbd.name>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Ryder Lee <ryder.lee@mediatek.com>,
        Shayne Chen <shayne.chen@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, Rani Hod <rani.hod@gmail.com>,
        stable@vger.kernel.org
Subject: Re: [PATCH] mt76: mt7615: do not advertise 5 GHz on first phy of
 MT7615D (DBDC)
Message-ID: <ZH74kw4M15qjDbTz@home.paul.comp>
References: <20230605073408.8699-1-fercerpav@gmail.com>
 <ZH72YwgpywPNxbd2@corigine.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZH72YwgpywPNxbd2@corigine.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_021302_882157_A68E444E 
X-CRM114-Status: GOOD (  14.22  )
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

Hi Simon,

On Tue, Jun 06, 2023 at 11:03:31AM +0200, Simon Horman wrote:
> On Mon, Jun 05, 2023 at 10:34:07AM +0300, Paul Fertser wrote:
> > On DBDC devices the first (internal) phy is only capable of using
> > 2.4 GHz band, and the 5 GHz band is exposed via a separate phy object,
> > so avoid the false advertising.
> 
> Can I clarify that the second object won't hit the logic change
> below and thus be limited to 2GHz?

The second object (external 5 GHz phy) doesn't have an EEPROM of its
own, and is created explicitly with just this band enabled:

https://elixir.bootlin.com/linux/latest/source/drivers/net/wireless/mediatek/mt76/mt7615/pci_init.c#L104
https://elixir.bootlin.com/linux/latest/source/drivers/net/wireless/mediatek/mt76/mt7615/init.c#L573

So it won't hit the logic change and it will be limited to 5 GHz.

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com

