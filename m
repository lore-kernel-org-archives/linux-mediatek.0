Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B08CA5FF0
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2026 15:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qH589Eati1pjOXOcBnGXShBFqiglBE/4FOHESK73PA0=; b=17p4PQrKfKzRbcuGjQJtdYygoh
	cj1UmlaGj4FaCzbyZuS7auMvgBhs/U3Yf9zenOWgZcUouLg44d8+kz05M6V2QGS08Geb9VzYosWru
	HxmZRMrZXuIErQitEjgyYJfbU7ZWm/Rf4CuuqciaPQ/Qm/poBdsc3VgaZAKMxGYJdARdQ7CHMhvLb
	XC+pkW1Jc+TZXUQkl1kbqnwg6DTQm6PAfC/gjFKgXHaZf75p/ROXDoJzxJ5/V8PhHAmcB6RUVKaMj
	Am/cxzyLe2GtlhCjEJldfQu2D2/REi9lTbeydSkWFt6qvFog1wyjCih79R0tBPhSTBuomEgj99fPA
	fjznJdMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDkt2-0000000Gmfb-3KXM;
	Mon, 05 Oct 2026 15:45:56 +0000
Received: from mail-ej2-x0f.google.com ([2a00:1450:4864:34::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDkt0-0000000Gmew-1NgS
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Oct 2026 15:45:55 +0000
Received: by mail-ej2-x0f.google.com with SMTP id a640c23a62f3a-c2e27d11f43so127398266b.0
        for <linux-mediatek@lists.infradead.org>; Mon, 05 Oct 2026 08:45:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791215151; cv=none;
        d=google.com; s=arc-20260327;
        b=PMLOpso17Hi7dnrTxf5Ap/n/aD+hHhbXDbyj+ibmfYpkRXCGeBxcMPQevoxnRjucc+
         i/JfYiEu3UadvdT2FRQHBa2Sakw/AYJYYK2Zlo0r/NBGxFa95VyMfH/CySYkcIajP0HU
         8d3kHa7tmnvAG2GOWvbkiSj+VqTUQMPGkkb4QZvbntF/YjVRu9l14cghpndLm08nNBSo
         0hBDpMy/X514rHx+qFcq9pbTsEC5bG8aVRLTSmfCAGKUqAbS8mTWs24C4tJzc4IXQDxG
         JTXPnjMxysTv3d5THlhQ3sKZLsssQKiuAOSeD6C3e0+OS52F/+Hepy+NrhMmAiA3DYMF
         rVXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qH589Eati1pjOXOcBnGXShBFqiglBE/4FOHESK73PA0=;
        fh=+rZryI48UWIdszaOAB5t1bY9gjt5zekyih4ZVDlSBVE=;
        b=rTmQz3cyXkoA119R9gT5wfSwFwF+IExLpxnSXOeHJVvavPLGTSkuB7VtIvkio+q094
         jqxn7zk7xLjOqCfTDkRENJSsH+Zp3kNd8ez3zPujpsMD91EpmKWLHUIOsErQeFJq4Hcy
         DHOB2GVE4BvzYs/2ea800sg1d+XRVjQgprNO/2BNzshVlkB+9HzHBybr6U2JhOC4BSTg
         HJqt6RXEDxl52qhxDfCRrJ2ocF/r+eFat9VCINqRM457jYD5T7Xv0TtI7SybvhIiK5Y5
         PgRZI5UFvuGyMYazk67JIU0+85iR17DMurUmxFBaPPwk/2Pj6Sa6OG2mitdqEKawUfNc
         nbpA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791215151; x=1791819951; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qH589Eati1pjOXOcBnGXShBFqiglBE/4FOHESK73PA0=;
        b=cuaDb3HVGsUI+LDSnIVbPh9onvJGu12y9UOdh4kP6g9v3Axn107HP4ov8sSPQU+gMF
         trrWhXDX3IR37trFrW/luEDh4G+dFkRMqZT0EhvOEYdzhNb90WcV2GmUs/YpY9PtUyz4
         48xRB7nUc3JFek5OclXp1zIzJGTxKqaS3mtVwr4mbHCVjgQJvSTBMf5x8OtHGr7JRQ2f
         CQzc3T22wmh+OTUKzDlTd6qH/ula8BJ549bbAVTXx94fuMiP5vBuv/3dS8c4IsRu/752
         c5Vdrnz383BL5HRwl9atVsHh6ar4e5Ho1i4MpYDrGtQXtrKK3uTzaFbrtsd8o96rL5n/
         FjIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791215151; x=1791819951;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qH589Eati1pjOXOcBnGXShBFqiglBE/4FOHESK73PA0=;
        b=dy0JYdnGe5MMluyCZVMJV2aVwzQ5M0CRtBkh8qQ/nhvy8abb12Fmtf25k74xMcOFCd
         9pIyAnr20n2vXclNbKV3wZgOMUT3s9h5ilZFijVSHUQXJHsUUX+3+JXW6c/PhIdjvP8I
         QZpaxrZpPzZbzkWhwFC2gpwqs/svq5OVVfx61D9Fx8y5C1CsIKGQrL1SgzXu7rLu3xgR
         0PaVar6hTp5XuInpjUjM+SJurGdn5pijkZGMxwLuAgA0rL35+Q/hYOst3Hh7MD0m7DZA
         zzYcV5d2j0EhlMzNYa25SdRhCmzVkTRzN+OOvQPHFlP184gWR9ZbL8p2x7VBBasNUj7n
         1LIQ==
X-Forwarded-Encrypted: i=1; AKwUvBzkBcQugVVjPBOEwF3b+VjkVbBfFdmzjjpUhAG8Bac8EZ3K91nyOHxpnNQIkAUPvhMiBnckXzIHFZSmA4qFMw==@lists.infradead.org
X-Gm-Message-State: AFuF++lUFoUCM8dI/q5DfNPJfDZ1L77FA40RQTE6TRStICu7umyDSzeY
	pF5rvybaXmaW2idga0CGH+X4sdNCtxhx7dgXesv9S6TFRuS9fdgZdHIRGN9oEwGCrHh5bAazct2
	89iHwcvahsW8A2AEQlKCyzjDkrZh/dEO4EL+ctaJV
X-Gm-Gg: AYBFou2xN4gFPa3l1GKJZSnyVMuDmIYFpj04WW46rpP9IivxdkcrloETcbChQwlpvAv
	AMQID65Zja4XRD1h3Vw/7E+gFNU/1/yP0IZ1FI1+NyP5CpTZffhcMrt/bRDDXP0vMyMiD3xrRGU
	5Y7L40lxQN6692ohHAeelxF1nckb2bRzhOE9OVKYgXQp9Ssaq7ATqs8GIKxlkSlZd7EWcAV3U4e
	zedVfY05KdErFMqrhJiveMpMXM1vXuJhBT9keNYjlkLlt3oclRKDtlNzYRtQB9vN4CBaWmcUkzC
	wzEHnLAuLEhOgsmQYAMzoKJpmX8jJKYaFiaTgp92IGiJ0Av4XY2YGR0W
X-Received: by 2002:a17:907:3f14:b0:c25:f7db:4beb with SMTP id
 a640c23a62f3a-c3160f1d01fmr894266b.17.1791215150701; Mon, 05 Oct 2026
 08:45:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260914085148.136429-1-peter.wang@mediatek.com> <yq1jyo8pwwc.fsf@mail.kernel.org>
In-Reply-To: <yq1jyo8pwwc.fsf@mail.kernel.org>
From: Sandeep Dhavale <dhavale@google.com>
Date: Mon, 5 Oct 2026 08:45:39 -0700
X-Gm-Features: AclHuK82KgNqsjE8F2p-fNUCpJ_mW3iXi9stcn4dXlH9FUwkkuZqdBeXATzDN5I
Message-ID: <CAB=BE-QT1oy=XD_MFWaR+VvKG_Kpk3jszDpAtUy=EyK9uU5fbQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] ufs: fix POST_CHANGE pairing and AHIT race condition
To: "Martin K. Petersen (Oracle)" <mkp@kernel.org>
Cc: peter.wang@mediatek.com, linux-scsi@vger.kernel.org, 
	martin.petersen@oracle.com, avri.altman@sandisk.com, alim.akhtar@samsung.com, 
	bvanassche@acm.org, santosh.sy@samsung.com, h.vinayak@samsung.com, 
	wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org, 
	chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com, 
	chaotian.jing@mediatek.com, tun-yu.yu@mediatek.com, naomi.chu@mediatek.com, 
	ed.tsai@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_084554_385530_647FB450 
X-CRM114-Status: UNSURE (   6.60  )
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

>
> Applied to 7.4/scsi-staging, thanks!
>
> --
> Martin K. Petersen

Hi Martin,
I don't see this series in in 7.4/scsi-staging at [1], or perhaps just
push is missing?

Thanks,
Sandeep.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git/log/?h=7.4/scsi-staging

