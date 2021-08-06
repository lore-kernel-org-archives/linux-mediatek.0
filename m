Return-Path: <SRS0=iyt4=M5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 056F2C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 02:35:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B66E561186
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 02:34:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B66E561186
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MxV9gaW7QStOUsLrRB2hLQV9zt1kAWcMF4wFqUW5+NQ=; b=V5UhWv+58UwXa5
	3cZ+0gaARBF8FUGEvKzPVPcDxCi9BCpbnFasR1vsRbTa5fTmST20bA/79zSTDfJLkJ1T/pxQePkNz
	QNuIqtYc2AZopJq0EUg28QpSLBfH6txdvfQxSOHzieq53WZAf+YyLuTpHrV9FIdTmm5fH78jkCCw9
	KtJlEf25ak2MehS7UitkLhUw+R6ZxVMvDayGJ+WA+5Yu3kAkWUxq1YrTGU9Cit0+931u556vj4+c7
	nwWItqduO2PKIS2T/RADluKPGTZhjhArmEtmd6mozY9Zi+5ntzdXgDHIorDlGLogZ8VkHIeKp6dU2
	jWq6m+9hF1Mc8UMjx1BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBph8-00BKwx-1A; Fri, 06 Aug 2021 02:34:46 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBpgv-00BKvV-B0; Fri, 06 Aug 2021 02:34:34 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 u5-20020a17090ae005b029017842fe8f82so5192300pjy.0; 
 Thu, 05 Aug 2021 19:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-disposition:content-transfer-encoding;
 bh=YTL8rATwgxSuPGDhJbThhFcHRN/9Vn25uHPn0zaGPNM=;
 b=X5I4I5hSZKO0FqOT8VVX6wA9MndpzlwOJSH1gYjIYGXpIfLfM3aat5kka3JlkO4NFn
 ZWhYW53gk9CUN+zYaKp3kz3eDOopUYqQNjPGwZdn1f8ib0ZyQfE4SUxwtV7nq6+dmrGP
 Vv9GchnSClXOq96Dy2xcpzTChtwai4GvWHp/BJbKMn8d6tK7CoQod1katCU/OUcNvOSz
 cGrFcFlZFrfhxyTQqLLmh9m8yV5OXB2dRqqP/f52j8elj3xFjJNJdpyNbA51iyIb1HQN
 I1CMXbd8q58ux+urT/kRwZfbaLfAIEQV0D6s9FQhHOUj3Ui/kDt3SgYe12XQnsVNBJcr
 +5BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding;
 bh=YTL8rATwgxSuPGDhJbThhFcHRN/9Vn25uHPn0zaGPNM=;
 b=B0A5uYoaH6VecfFJlnga2tppbyrv4eQ9B1NYy6mgYfPTkvjRAD2pDiP3rRgdgHpqdh
 ZS5ypJ+3BM0cSNZdKa6p3Vp7L/lEM/4U+zmPBim7kEy+iroY4E0RBxZSgo2vEq/xLbqd
 B9NXEGVoKcWh5n2+/rXHBad77zyMjfaHbD4vqVjQ3jvIiB+KXaVcExno53PEujpVj/B1
 UCP0B//lBZLF9+5anYPh9HQ3Pto7Xz6g4iHwSmPE43ykXlGDQ5epOi7md1ZzJEI/lNtZ
 i1OrdzxeWo3ouk2YbK7Ix6aO/qjAY3C5l8KZqMwYKzyelm3t7qQuWY9N49UlLzYNMQzR
 axyg==
X-Gm-Message-State: AOAM531yCg8g5UiTtpkFEj6ZsHEm8wQVQjx/G1ZbVvfkndvgH/d/PDnr
 RXXw3ezdqAuxRoUa4RMU3WY=
X-Google-Smtp-Source: ABdhPJwidkXXkUXiIi8CIl8fimh1qfF44CfoC43Ahyp84TqgG6PJhxxSaLVSz+5tjMZn88RSbcxqSQ==
X-Received: by 2002:a17:90a:1b2a:: with SMTP id
 q39mr7615105pjq.219.1628217272638; 
 Thu, 05 Aug 2021 19:34:32 -0700 (PDT)
Received: from haswell-ubuntu20.lan ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id b5sm7190597pjq.2.2021.08.05.19.34.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 19:34:31 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: dsa: mt7530: drop untagged frames on
 VLAN-aware ports without PVID
Date: Fri,  6 Aug 2021 10:34:23 +0800
Message-Id: <20210806023423.519560-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210806001740.cayorz3vlfrvk75l@skbuf>
References: <20210805172315.362165-1-dqfext@gmail.com>
 <20210806001740.cayorz3vlfrvk75l@skbuf>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_193433_425316_1B1B44DC 
X-CRM114-Status: GOOD (  12.61  )
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

On Fri, Aug 06, 2021 at 03:17:40AM +0300, Vladimir Oltean wrote:
> 
> Good catch with this condition, sja1105 and ocelot are buggy in this
> regard, it seems, probably others too. Need to fix them. Although
> honestly I would probably rather spend the time patching the bridge
> already to not accept duplicate VLAN entries from user space, just with
> different flags, it's just too complex to handle the overwrites everywhere...
> Plus, bridge accepting duplicate VLANs means we cannot refcount them on
> DSA and CPU ports at the cross-chip level, which in turn means we can
> never delete them from those ports.
> 
> Anyhow, enough rambling.
> 
> Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

Please allow me to send a v2. This sets the CPU port's PVID to 0
on boot, which causes some undefined behaviour..

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
