Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E208C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jul 2024 09:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yIVNhiC49pu3LQQuucdZLz/ASyKjQzHX04ThHbZ/y7U=; b=XO+XlmeUcb0jSLMHAICFu5BhN1
	QJQCS4zovjzbLBx7eywAxYeO1JTdl+USRk/7vTyR287dg/KmYUl50pUM1Bfe8XEHmOlhqx1GP2c37
	s3+oW016ykbTWdvIAIet2OBaIgoHKxnKwq10KzbKiShZd9x/v6FR+Wh4nFe/9SI8iNSk39L89b2cd
	ZwAMTXe6uC+1q+E88lOQmxJP1i37zvA7S0jVTHmre81Jmf3AMp+mzwi5rx0wuOsUSBG1oYM5yIRjJ
	v09pfApime4ZGxff+QnhPfo/rrmGGItRJmE1FAhD+/7oHs4F6lsitqQ7764sqPvulR6NDZiubCx6F
	NwIPoHEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSD3B-0000000HDFR-1OZK;
	Fri, 12 Jul 2024 09:58:49 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSD38-0000000HDDq-2PfV
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Jul 2024 09:58:48 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-58c947a6692so2432963a12.0
        for <linux-mediatek@lists.infradead.org>; Fri, 12 Jul 2024 02:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720778324; x=1721383124; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yIVNhiC49pu3LQQuucdZLz/ASyKjQzHX04ThHbZ/y7U=;
        b=OlRgSz0LRTLTGz8aahgVbNDPbiSt3+kbgkuEQ2LmdPb0RlZjmB4FAmZbw2KrkoYlun
         iwz3GX/vJBpnZhyGq8yQWRFwrJYF177pkQOecSAU4bFZhVwvkutLzwC5sDHLeIArt2LK
         CwewWxEob4ZhMXgLw2Iqn+9sxByB/Kb4UsUjKWoXrQKI/KVmG4wJUJlsXacLr7ZXY8PN
         YTLahrGky3VpiyPLXJTPmWkTfDlixb8usqVaLkAVLp5jT06avSHZi/sBZhulVi9W0hMA
         WJMqoJJX8Wu9TPd/XG0RNNaamdJ5BhxrXdTtfm0hqWXcl/XW9QdHaT++/c9jcMUIM7F0
         +QFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720778324; x=1721383124;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yIVNhiC49pu3LQQuucdZLz/ASyKjQzHX04ThHbZ/y7U=;
        b=T6Vl7+/JVS5eE6p+3/xVCOi6F8rHbGETsOuzGicyhXPS08wqOwAKC7eMEmuQPtbS+k
         ttp+gRtldCnII9OLg8IFMI3Sgp8rLZDaIydGU6gbXFT79zdW//ofXbKAlp5K+5wJYlW/
         W/ow2MVUq77w62Jz7DKqgYvVHHoFjdrh62zIzUsgSZlzIOkNOPYvIEJ3ZKV/Mh1gJbCh
         3LTuY8qAFqoIelSGlcONOd0iIQBXC9vk5572eIKdNTZ87rRZA2s/eH5T3lWy2JwgDIdC
         oA520gIUPFQg6pRHR0/mNsnhffMxOq2CuWnLfIdaBMtzwcWB63CZozMhFTRW5a/eK5Pd
         AzjA==
X-Forwarded-Encrypted: i=1; AJvYcCUGAGqAj2fjUGcvQww7dhdUzaJqTft8vh9k5rvFkZ44DcMrxxXi9sENTTNN0H1Qb+V52E7ecDzmy+HcrtJ5aIXhCd6c2Yr8tNo3AgUtq3o0CR+v
X-Gm-Message-State: AOJu0Yz+jgbvU3onyHavjG0dfVnqbzekuHj3mholQk33G5LuatmXuizU
	8mc8Y9iIl/lJdf9uzc9y+EFZNcRZOOT/sBJr+gBM7aEHUoAA9ZLu
X-Google-Smtp-Source: AGHT+IEA4JLouBYbEof5XDgc9pdOPBBaJQGzudP9LKkHrWF5+7if+TPu0tYuBrZL/Pq9KIShzs66nA==
X-Received: by 2002:a17:907:9809:b0:a77:c314:d621 with SMTP id a640c23a62f3a-a780b68a2f8mr961761866b.13.1720778324447;
        Fri, 12 Jul 2024 02:58:44 -0700 (PDT)
Received: from [10.176.235.56] ([137.201.254.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a7ff0b0sm328472966b.120.2024.07.12.02.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 02:58:44 -0700 (PDT)
Message-ID: <7d628f0aa3e5607fcea80085f65d9bfa6b94d563.camel@gmail.com>
Subject: Re: [PATCH v1] ufs: core: bypass quick recovery if need force reset
From: Bean Huo <huobean@gmail.com>
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org, 
	martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com, 
	jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org, 
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com, 
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com,
 powen.kao@mediatek.com,  qilin.tan@mediatek.com, lin.gui@mediatek.com,
 tun-yu.yu@mediatek.com,  eddie.huang@mediatek.com, naomi.chu@mediatek.com,
 chu.stanley@gmail.com
Date: Fri, 12 Jul 2024 11:58:42 +0200
In-Reply-To: <20240712094506.11284-1-peter.wang@mediatek.com>
References: <20240712094506.11284-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240712_025846_634671_A0BBDBDA 
X-CRM114-Status: UNSURE (   5.93  )
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

On Fri, 2024-07-12 at 17:45 +0800, peter.wang@mediatek.com wrote:
> From: Peter Wang <peter.wang@mediatek.com>
>=20
> If force_reset is true, bypass quick recovery.
> This will shorten error recovery time.
Reviewed-by: Bean Huo <beanhuo@micron.com>

