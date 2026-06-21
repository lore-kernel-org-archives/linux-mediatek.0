Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAAB1CDB466
	for <linux-mediatek@archiver.kernel.org>; Sun, 21 Jun 2026 07:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hMvYItPyzRe1gzBuo0wIhzY+wWucW3fQKtqTXdUcD40=; b=s1CrRktbmAAC7RzQigzJOXD/AD
	vLMzIng19pTbUlp8/T4cHywp8iw7AvIwSBn+hdASJH0qkCYMM1Zui9F5N4+gW4L8iqwF1w7cgA9wy
	ZeTMe00apU+ZH1Eo75UI/DLmj5gho1Y4UnEJ7HHgjRbQehMR/oQJT2qrQVkhklkrwe+gATr8DHPfr
	/MyzJLaZkzhjgbSAueZ64jkJcsb3gc2mr+gCHKsh5D/unnG8j8qJCSpSlrGLbyPp399oxVLlrj+I2
	af5f2H85XIpjpCTcpI4r23O3PM+DLdFwFDVgYLyg1/EQG71y7xjk2j1aXWR+Ou7FcJXS4gOxy1O1x
	+0Lq/Low==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbD1n-00000003ojW-3F6a;
	Sun, 21 Jun 2026 07:55:39 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbD1l-00000003oig-0Agg
	for linux-mediatek@lists.infradead.org;
	Sun, 21 Jun 2026 07:55:38 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-c074ac8adaaso399266266b.3
        for <linux-mediatek@lists.infradead.org>; Sun, 21 Jun 2026 00:55:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782028535; cv=none;
        d=google.com; s=arc-20240605;
        b=ABetuHYa/kiqoC4pSrvL8PXF8uqKUd6YrNpcvU4G/gsgxvi989/xC+qChOE9Vjp/Pp
         q5CzOaWTz4tGaujvcrYOyz6NiwjCPyYANFr5Zp4rDM+NwOPIczuCSh5iGctYZDqmz0tp
         GbQWcBE6zD3oYZOzh8keuCxtg5rn1/P1OC98+3XDlCvKulsaGbtBEQ6b+Qr05ARkFbkt
         fvk5+OMU5d7eCkxrJDVd79lg7xUgf/aZJ+PjVzl5Pi0go06rIuXAtBt11CuU5vVvNHQt
         1hFv8cW3IWhaiV8uo1uz5tJATbW5FrSbbjrQ8ydh94emEFRrWnj1ajE3Tj186CKcf052
         +xGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hMvYItPyzRe1gzBuo0wIhzY+wWucW3fQKtqTXdUcD40=;
        fh=8TheaAl1knvdbpZFyP60oULsQjRfEj4bRwRTqXZW0I0=;
        b=WmFKCH6Xt7QwO0wY/vuDIH+gfVDmRnexp1ajogX134vZfmOQlhsFg7LcJu10X4YCSg
         /CooD5h2Rjt1Gji7Ew0KmhSVkcQV8qQLRRuh6SCmdkPrtR9ol5McWpaVPWxwaTA3jEmV
         /L9U3dX4o7OjCwkd6UtSmF9rEBsjjUyv6g924Y+wiKLchH2fzq4Hq8GlKjtJysSAB3JF
         GlWSFSbA8CrjVGcbYXnj3WW2FV4l2+4xrXXBEieufh8jf+BboMq+9RjWPA7uc16nicQA
         NaTvGouoIL+SEKqQ7r1+BDcSwFWVxfOEnK6Dr3lgxQED7yXhm67HJJL939AcoUBH+Y0H
         6gig==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782028535; x=1782633335; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hMvYItPyzRe1gzBuo0wIhzY+wWucW3fQKtqTXdUcD40=;
        b=QzeK7U5Yasoh3jP9J69UrKKT53PJWAHcbjfsufVU6/RILZPc86bJ0Q6/uTNuc6GiR7
         XCXnQKaKPpOFXy559yH/jAaWiTnBBf0XHAjsFZS3kxZTlSezwwwxySXgnyNdTiomqkQy
         k7AGjy+iIfEuTGhuL3g6hyVrY0P3J0JmfODhKioGzlQjtnZhLeEuZ9xalbXNMOpK0NBB
         /1Z6rDOs0vAT/l0XSi4327TxWE0EzsRWlWrDnS7jJFukGqlp42ZWfeEsRLgkBMjx7p79
         TfWV2eCwrBtavYgQZN2jDEIhxKB256WuJ3vDJ/ZLOD2qMsC2TTed0G5OYF8UXmbj7fzL
         V/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782028535; x=1782633335;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hMvYItPyzRe1gzBuo0wIhzY+wWucW3fQKtqTXdUcD40=;
        b=HDYrbZv9/eYe+pJtK2eAs3izgFty7u5V+zR/6l1hgUx4rD13qHLcLKcr5bK3eXy6V5
         bOjWdyTYUtwK+FSbpCoQCRC4ttb40OwFh4o6eBFyxHEzd0Z/6achRcYmfEuL8gNRkLYl
         0ddb8jR8j3u7eCfIGH8eQj56YDWfulddhJahbLcZVzRqVb7Ne/xywct6lbOUQnH/On1M
         cnhJUGgAza+thurHN61xPlJHXh7V+LjQ7s45in4vOdUhQOjvdvr3kqmjKDtGpJQ/wjgr
         /ecH59S9i5UBW3oeztyEcTmsDe+2RsRLQ/tZUzzV5gGGAdRMgXQzOLl1mDc1qXSSRkvO
         QYIQ==
X-Gm-Message-State: AOJu0YyblUx0LvU9LUM6C8bjKgTGu4ouW1fqoQb9e3bhxSSDJSkKtP7Z
	26CdEz1M7N/ZPJIpaU8LsRDV3onG1vBSowu4gpFjVGTudAnnQBuiUdrHMtUtqghyZO4BE81haP+
	FqyovxsHVUVw3BUUzxG3BiVOPqF8seRo/TDZG6bU=
X-Gm-Gg: AfdE7cmjM/jNi7xmCfYajx/we0ugTc6y7Hjfv0mWxbsbEiDyNlnI07Nv80Azv3AC8jx
	odjQLqN7B8qccCjfi4OEJzTlsIiN4zWygXzRHZVI9xh5ct5RcBeezNhiKmY5pqj7hzM8+tmNuNo
	rpMeW7lzFYJ0B+agQrE4poPwQLABXBjWuBVqnFcQQ9VaC4oiY2Cez0DLc2TfdGvotB1EBZIx4Pz
	hIlG3Qf+2lOsp8f7bRum88iB3JTbf/ocD5rPRK7rroCh4FjeMlg6L5uQraHvJ4F0wApygvur7UD
	O5NBqqvYfzPG8vG6jHrZatD5Kyr+
X-Received: by 2002:a17:907:6d27:b0:bdf:8e2a:1092 with SMTP id
 a640c23a62f3a-c097adb13f9mr573581866b.3.1782028534767; Sun, 21 Jun 2026
 00:55:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260620200032.334192-1-l.scorcia@gmail.com>
In-Reply-To: <20260620200032.334192-1-l.scorcia@gmail.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Sun, 21 Jun 2026 09:55:23 +0200
X-Gm-Features: AVVi8CfSZq6Enj-XJKx5vjhFc4xd-jMn2ZAzgLd4cUoBxN01IhUJaqR7lto47H4
Message-ID: <CAORyz2KB3jaRc5EFhDSuPox794UUeDgT5kRFe=jFg_rXuR9eSQ@mail.gmail.com>
Subject: Re: [PATCH v8 0/9] Add support for MT6392 PMIC
To: linux-mediatek@lists.infradead.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
	Val Packett <val@packett.cool>, Julien Massot <julien.massot@collabora.com>, 
	Fabien Parent <parent.f@gmail.com>, Akari Tsuyukusa <akkun11.open@gmail.com>, 
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_005537_127000_8AA98784 
X-CRM114-Status: UNSURE (   7.21  )
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

Sashiko review of v8 pointed out some easy-to-fix but real issues.
Please ignore this series as I have fixed them and I will send out v9.
-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com

