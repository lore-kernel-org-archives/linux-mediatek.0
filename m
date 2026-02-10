Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A615FEA3F38
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Feb 2026 10:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wt7NnjuhYR2KBDv6JU/NFHr/7oZgaw0FyHpTViakKPE=; b=C/DaJmsSDSWernw5DGSAEaSbRs
	hBASOutFJY9a8dQU8P9O4LXZ4KRL+l8guGLFkzGYVd2I9Ft2Fh/x58AwBezC2jfdIgn4wGSM4H+ox
	5snUpiu05H/BgFleAwZ+mUid20+LjGbpjfOYxUdNc/AjGt8HUiQ5rh/faQu9FSkQGoa/byhOatZf9
	1LnJ5cEHOjF9+NnBYWjT/ASInWEFtkFlhxS/2oLOup3T837cI8/ReUIG5Oh0AdctjXQSlOvu5wdew
	j2BUdHwhDPm55r1boE57Zm/089NO8zphp/i8E8NwUnM/aFuyD1egk0RGl+sLy3YYRSjBhHL7HTK4x
	4WpUF5BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpkhS-0000000Govz-0bsp;
	Tue, 10 Feb 2026 10:10:30 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpkhQ-0000000Govb-0JBi
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Feb 2026 10:10:29 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-43767807da6so455218f8f.2
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Feb 2026 02:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770718226; x=1771323026; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wt7NnjuhYR2KBDv6JU/NFHr/7oZgaw0FyHpTViakKPE=;
        b=K71YaVhqcbIHXfsEi/xlS/KPlvGPtaPkORPFT8DllIxhXei7NLZ9DWoy+qclF6fSzL
         YEN/KeJgLkNMBgW18tmWAZkXSc7DjWs8NnLF5f6Twwg2UsKLkkXkMQplna+qnCioio4I
         znflxqycVclszPCYKLup7PBuLV2ukZVlymNp+xL5hkBGKLOE+/I/5nF9rRRVqZiuVh0q
         J3l8DD+ve/6/tzQi1hQL8TB4rWsRwWFwUNs6PfiV71tHTwm917aMyLqvkpdPfNzvmV/V
         PzSK9/Xc+tFP7IGoSRefd616pr2in0fboSrECeQK78XXNwj2iIiIgf6wTBgRbt3Re6bO
         o2cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770718226; x=1771323026;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wt7NnjuhYR2KBDv6JU/NFHr/7oZgaw0FyHpTViakKPE=;
        b=QDXc3pCmwuTKU3MjiPFBCayeq6cUKb+jvxYSVUm35034jAgpDC9ySTT3HgMA3UDE5B
         NWC4RGyKbEVfqAZz3H5BQ1dngVYdaXWbgskLjCVqfvtrW+qxLjEjme7wZnySoKYLLSBK
         iPUiOM6wzKLluytMI7ygIZxCPUBu/6o2XZ6XPQdaG6Z4HPqgnO1hkzo7Ff6UK2QGiwDb
         oQgvx2xfvjqL/T+Fw6eTcziEMH3jXY4lfW0Db8sPVk7hM8A1o8S3sOs/UycW60IYBuvB
         qeWvv6AB4bSgDGK5ZcG0vL08QCH/eA4kb6jK3l+abP5HsKvRLG8tl79hfnlTw0SLQnNu
         dvKw==
X-Forwarded-Encrypted: i=1; AJvYcCVL/A/GeQWFGoAjew5DLEKYnxdDxC1qQdJRfgSVG3LYLjPF4/LMfOzvLTA1iIM1q+Sk56e54EGvvmDKFRYTqA==@lists.infradead.org
X-Gm-Message-State: AOJu0YykyWAgdrULl6it5XNbMPLEk8iP5I6LzWS7/WNxwG77XRy9s6OU
	LFdUE1PDUede+CnEGhVls+B2KRk9GJxv25xa8T2TRGbH5VyIgXQu2vmN
X-Gm-Gg: AZuq6aKKKT+KRdjsgLymA3MpqvIXbcmr1EDQl0wWR5w2oKH5rSwhOjovkgPURHFVYWO
	tDnLZvxgbV2BKJhbA3Zd0hI163uIpETxvYgdLnIG7KNgAxDkIIpaCF3lmSZIY21vE71yh/5OsJM
	oNdgaQ01TTV9dJjO0o8vMhj8Ec09OjcyUxVsYS0pHnqrqyBbqgiYZbEw/KkGnuJk0HtNVnrnG0V
	Q9ecZEHxz7JfQ3JK9OEKmRgYmVb1aj0D7wkn9KIzee0IHQkDDvuHjMP0+kPMmWVzb7OPTm999/U
	0carVZmbYI9QS81vjbBmgZRs9Dn9qDYnXs4bhlDkzEcLIVyIsOaEsosolkTw9iU7TavgZ5OA+MQ
	Crx6zv8QAySi7m7jaXCoXQ1i648ZqKaw4jpK8QMNuRfwKsjiDSmbUBX9RqVTahITnJVa/4EeJA3
	miPYpIodEEegKJcB4l2kWqna+O4w==
X-Received: by 2002:a05:6000:2889:b0:436:1a24:df81 with SMTP id ffacd0b85a97d-4362904b702mr20341629f8f.2.1770718225617;
        Tue, 10 Feb 2026 02:10:25 -0800 (PST)
Received: from [10.176.235.211] ([137.201.254.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4362972fa41sm36773507f8f.23.2026.02.10.02.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 02:10:25 -0800 (PST)
Message-ID: <12c200207a5e4419ed3f7ba54aaaf2f74db80de5.camel@gmail.com>
Subject: Re: [PATCH v2] ufs: core: support UFSHCI 4.1 CQ entry tag
From: Bean Huo <huobean@gmail.com>
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org, 
 martin.petersen@oracle.com, avri.altman@sandisk.com,
 alim.akhtar@samsung.com,  jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org, 
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com, 
 chaotian.jing@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com,  naomi.chu@mediatek.com, ed.tsai@mediatek.com,
 bvanassche@acm.org
Date: Tue, 10 Feb 2026 11:10:22 +0100
In-Reply-To: <20260210071834.1837878-1-peter.wang@mediatek.com>
References: <20260210071834.1837878-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_021028_124884_B6025C34 
X-CRM114-Status: UNSURE (   5.58  )
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

On Tue, 2026-02-10 at 15:17 +0800, peter.wang@mediatek.com wrote:
> From: Peter Wang <peter.wang@mediatek.com>
>=20
> The UFSHCI 4.1 specification introduces a new completion queue(CQ)
> entry format, allowing the tag to be obtained directly.
>=20
> Signed-off-by: Peter Wang <peter.wang@mediatek.com>

Reviewed-by: Bean Huo <beanhuo@micron.com>

