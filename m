Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA44AC3DA5D
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jul 2024 09:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HlxvjKSw37Exxqwv0WvuuxqcpniDdZENVsSWO+JV4Ms=; b=IQFJkqiRTvZPoK+uf/z7juv5hJ
	jShF4utZTvRfbKbX8/pFM2LYE/f891kBlgHn6kaDoLTlg2ScEf1Y17crv+B2UYryoO3HiiAbNOluU
	WJdAcGZjBl4WR70wjXwszH7AbB+O3nqVNYsvu9jMmiJ+gzUHrczHoqN5BjlwvxQY33Psn7I1HtdPC
	7nwJ/d51z0jKuF6BwNuAtdca4ncxGjsBLxvREv1gWEU8RZwH01UECwZrrsOycXyjRpJtzvrPorHrX
	n5Qg5EmJ3R5KN4dy5ronnaYEoxFYdmU+unpn3G3Gq7Y1eGLBmSOayQu4YEtMQqdFgZPrupWczHCea
	uS4tQWDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTI8t-00000006Yad-1TDQ;
	Mon, 15 Jul 2024 09:37:11 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTI8r-00000006YZW-0mNl
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Jul 2024 09:37:10 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a77c4309fc8so521984566b.3
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Jul 2024 02:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721036227; x=1721641027; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HlxvjKSw37Exxqwv0WvuuxqcpniDdZENVsSWO+JV4Ms=;
        b=QPq5MZfTCLsLCrvs4vEwy27BIp3nW40PB3Z7iialqe5Q2XSobRX3UdpbGRqgHW6C57
         9SfFmkMkOLsoGcleWBX6k5WqqD4z7IQ6ShkK3BZ1N47tULGw2aTvhP+fvS99Jb1r2UPI
         dYIbsy6QUqvXpii0EmxuUoUjIl+rHi+5vrpUK5P+8iRLfzDAfaX2URvIxPaIBzTKP6fb
         Gyo28NJXuGT2Yw9ILHZODb6u4LvJZ2HZCp6XIWFSCBv1EhS0wcQ+10t0zaTqmSmZ7cI9
         arZOC6qDgh39dqHP7x3tZx9+UFyW6+UK8WoX02HBHed4jMNkq6Vb9ZQ6gyy8wVZrFRlt
         auPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721036227; x=1721641027;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HlxvjKSw37Exxqwv0WvuuxqcpniDdZENVsSWO+JV4Ms=;
        b=eyc/Ty6en8+CB1aCQwxohwz9pD/07Yx6W7/JR4talw+9WDhoFcSiqbQZij9F/uCin5
         SwHNrdBausbi1z5bdD1w4sjdH5+TVqSZFRAjEc8yERFzHiKGyMiaWEjAM2l3okpQzOIt
         G7zvo0Ok3FwljEu/S9bb/HKL3ritgYjxmE4FxFTP4C+e0lnHJjUEAyt9vOnAas4di2Fc
         PNa7FI6k9wIKgPfiyr+rNBcSML7HChyltL4O8Acq0j69tWpTFEfMIhcxs942MIYvR5CQ
         xb4z652XrFcAeG6LN+HnKnzMJ3IfokFtbTcSxPf3ktiU56IC+Q609MkCxtPh3YBiAZg+
         hiiA==
X-Forwarded-Encrypted: i=1; AJvYcCWThq8UKgfdhoAkYHlmcWTHNyNfdV4/MexItR+YkbmNb6a8wIQ0gp0a0dr7aW6NfQSIt8sD6FATa1Vq+PU83HaX+vW5rlLdnovsBvjiAIrm5CdH
X-Gm-Message-State: AOJu0Yw+UtOCxOdLvOVzTGBTy810qtt6p/Crt5HRIkOoCe2Xq8IaZUpG
	hJwJ0OrFl9/JqHj8CnL5B5XL2YhBLjoVsWH9zeDt9tbqSXYWZGx4
X-Google-Smtp-Source: AGHT+IEOrWpmly9UTC7vtn+qdLIa1iu+1Yk5P6cQKfgejLAj0rOHvN9wAOhDaWPYh7GNC7BHfEEyuQ==
X-Received: by 2002:a17:906:fa08:b0:a72:b811:4d43 with SMTP id a640c23a62f3a-a780b883462mr1076718966b.59.1721036226951;
        Mon, 15 Jul 2024 02:37:06 -0700 (PDT)
Received: from [10.176.235.56] ([137.201.254.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc5d1f57sm196384766b.72.2024.07.15.02.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 02:37:06 -0700 (PDT)
Message-ID: <b547225a0315f1729c07a5d59f0db91c33af8e51.camel@gmail.com>
Subject: Re: [PATCH v2] ufs: core: fix deadlock when rtc update
From: Bean Huo <huobean@gmail.com>
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org, 
	martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com, 
	jejb@linux.ibm.com, beanhuo@micron.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org, 
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com, 
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com,
 powen.kao@mediatek.com,  qilin.tan@mediatek.com, lin.gui@mediatek.com,
 tun-yu.yu@mediatek.com,  eddie.huang@mediatek.com, naomi.chu@mediatek.com,
 chu.stanley@gmail.com,  stable@vger.kernel.org
Date: Mon, 15 Jul 2024 11:37:04 +0200
In-Reply-To: <20240715063831.29792-1-peter.wang@mediatek.com>
References: <20240715063831.29792-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240715_023709_469218_EC5FA46D 
X-CRM114-Status: UNSURE (   6.01  )
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

On Mon, 2024-07-15 at 14:38 +0800, peter.wang@mediatek.com wrote:
> Fixes: 6bf999e0eb41 ("scsi: ufs: core: Add UFS RTC support")
> Cc: <stable@vger.kernel.org> 6.9.x
>=20
> Signed-off-by: Peter Wang <peter.wang@mediatek.com>

ignore my previous two emails, I saw you have just skipped update, not
skip schedule in this version.

Reviewed-by: Bean Huo <beanhuo@micron.com>

