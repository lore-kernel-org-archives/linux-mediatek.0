Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6AC606A329
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2026 20:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FXlfpMof;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O3gogIN8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pHNoqtp6/IpvyophWtpnBoDa9f++9QWYTnZvFZM9okg=; b=FXlfpMofymARFj
	SSYqyj7OjOLoR44E9vFk41pu7rSiTZrghhKXLm8lDeClUrkKBfMB7MfAMjneQHXtLkwY6GlhPkLRE
	nWZ/qHrPiLRJvroMav+mVsgksgSRXl/LxXaUP+K95tn309moW4QzcgOX/X44jVc3A4zPc+1o4RQas
	O6buyafee55KzwR2TJXAVi9zF9iflIJc8/khGRP1dzIr4eDMdw2IzMaHQTbsgmchVqXhnibRZX615
	rOczfBwqkDsDQ37AOn8jpNmvQA4biv8u3gcrC8saDUfJofWod7hLY+29skEOf6UhjTa0ZsA08IFIf
	pCsnoZIRmS20PU6qg5Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWJQB-0000000BF6Y-0Cbt;
	Wed, 25 Nov 2026 20:16:52 +0000
Received: from mail-oo2-x05.google.com ([2607:f8b0:4864:31::5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWJPc-0000000BEma-2svO
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Nov 2026 20:16:18 +0000
Received: by mail-oo2-x05.google.com with SMTP id 46e09a7af769-862a1dbb516so1118243a34.0
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Nov 2026 12:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795637775; x=1796242575; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pHNoqtp6/IpvyophWtpnBoDa9f++9QWYTnZvFZM9okg=;
        b=O3gogIN8wtVR4p2J9dvTRMttMAr7HddCV8T/NDmppMzkLyqB0SGhl4dchGNU5Pw6v7
         rdi0mRn+FKdl5Hq9DoY2yVY6ms8sNR3fBArYU6Z5GE0luHYbqGJZVxUnIg336dJRvyh3
         DkZYZubC0GedXp/R54LMBJmLa5HHIGVHyx5bTMt6WyU9jlNU+9dkZ3X4rNOv94DiggaC
         86v4oUOJPd9ziZDGA+zazz/tBS6KrJ/1cMSdF84dXQrDzodrJR+S3rMZ9P5WnOBSzkEW
         FYjIZljtqX/ZlCtvS31f/Fnt2TB5DcttTO6oOr/K2wV7aozZfnmWgkUKfNFDyrKCvFnB
         6CtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795637776; x=1796242576;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pHNoqtp6/IpvyophWtpnBoDa9f++9QWYTnZvFZM9okg=;
        b=WmgUSX/H1Fp+0hpK1w0IulDUXu+5WJTQlBdZ5z0vST8/+h9v4n2PV5cTJOf0eS/Dml
         zk5jmUCOMZe5WsjHJqSbTuTpmzy8Rdf0dEXTVNkAxGPsWrxATzjSWBKf9ezhKYatxWoZ
         o4IiXGwZn4HQKwCc2E2dTIZOpVgbntJeMNtxE7fjY7QBe87oH67Jmq0zEI5qlHd6jJEp
         KW/jAzmgOS+KEgZCozHxsy9mUoNuEMURrTuzkYOonI6iNxLkkhxv6ls59PTeIMlL5Wcv
         onG4NWWH1kh7z6Ba4KzjZ9Jg5WUGNVxB/YNhwBIuBtieuwMnkKtDkSqJIkOuOOjhQwI8
         sP/Q==
X-Forwarded-Encrypted: i=1; AL+hErGVJ4dqkm3Ft2jv88h8RRFpmQ1N2PKPqzmUGciUYz/U+5jELwh0rH3Z4W+I++o8BGd9fvIF1OcRcKRt6GX2oA==@lists.infradead.org
X-Gm-Message-State: APuU4Z8XwB6SqLhF3DIMDn4Ri97fiGsdyGAC+EWB6YBU1PkE/4QAp9Jr
	NYMTdbxgp5JwswFB15P28lA/IU2h12hBmbVjvG6uKPl28wuqa4uj38fS
X-Gm-Gg: AZFdTZc9szrPKNtPMiK6P6igpxDzqRAuG7gzpDs0Sxwo69KzM7Fw18DgXNll+92mOYP
	uNQoRBZIIDl5SYmQoFp9c2iuKwhwsxLRBEpM8XBHsmMKLrfwCqij1IBBjQWsD2U9rZmiwtMey5x
	1qPj7+qNUC0KcoTMpWJXFnY1ATkN3yTF8PRXYYf5d8PPGpyL29x4dgPjwNi5KLKHNZXfTCTuLdT
	071SsCvuBZbEgXxyZtppIvJA9NP6JDc4R5EiwM9Si/27eLdzi6vzjePpa8phZ2DUALYSUWL3XrJ
	fSojNxPxSVZmhemYyvEnMlRvu2XnhWQCccAifilgyEwj/clqq51lkkRh3b009M9qxUov0KyQwrE
	SeSfLG5JAzWIiVXZe6Ewgnc1zTt25TS4VwkjN9nRgfgKl22qwOsiKf++2Ppl22D++wp8G9No007
	yiBfqdSbAgIGCfLAiTUSF6oiCuvRfy55+szyiqXCvwVe3QEblXFPSMwrEgz+Izl1ZRLlBWTxmnQ
	8xj/HmGzcLy2q5vcVuMNiUSl7gICMlEKu7U4o1FYVvADfJVQBjN54mUmy26HxrKANSwlvIvS6Lx
	7ruc2iilP0PdNgZPgj3wV07ku4h2wr/1s0TuS7ktB2vNZtQdRYvyHW5a
X-Received: by 2002:a05:6820:169e:b0:71b:79df:90c with SMTP id 006d021491bc7-71b79df0a27mr2553155eaf.79.1795637775644;
        Wed, 25 Nov 2026 12:16:15 -0800 (PST)
Received: from [192.168.0.98] ([50.26.120.197])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380b6f82sm11341859eaf.10.2026.11.25.12.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:16:15 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Wed, 25 Nov 2026 14:16:07 -0600
Subject: [PATCH v2 4/9] media: mtk-mdp: Round MT21C sources up to whole
 tiles
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v2-4-fdc047cf75a5@gmail.com>
References: <20261125-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v2-0-fdc047cf75a5@gmail.com>
In-Reply-To: <20261125-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v2-0-fdc047cf75a5@gmail.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, 
 Houlong Wei <houlong.wei@mediatek.com>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 Eizan Miyamoto <eizan@chromium.org>, 
 Francois Buergisser <fbuergisser@chromium.org>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Youngjoon Lee <getfeus@gmail.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Ryan Brue <ryanbrue.dev@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795637766; l=1332;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=SML+TmgHSjoTNgMjQurRhuTtIXSo3udus0sid3UwpCI=;
 b=O6W72FlbWN4LuV0iiRLk2CkaYM593a8j+vtxu/b4eIoC58xSpkFVNzhRcnOAn6Ev/MJIHE5Hl
 IFgMC6jS43GCBp+hiHRxs7WXkGzOImAzk9Iax4nRoP1wVzh7g3/DYbS
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_121616_737178_52BDE5E7 
X-CRM114-Status: GOOD (  12.96  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

MT21C, the MT8173 decoder's output, is laid out in tiles of 16x32
pixels, and the MDP firmware refuses a source of a size that is not a
whole number of them: converting a 1280x720 picture fails with -EINVAL
for every frame, while 1280x736, the decoder's own buffer size, works.
The alignment was 16x16, so 720 lines passed the format check.

Align MT21C to 16x32. mtk_mdp_bound_align_image() already rounds a size
up to the alignment, so a source covers its picture, and the visible
part is the crop rectangle.

Fixes: c8eb2d7e8202 ("[media] media: Add Mediatek MDP Driver")
Cc: stable@vger.kernel.org
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
index d2813890cceb..34d02de4453d 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
@@ -40,7 +40,7 @@ struct mtk_mdp_pix_limit {
 
 static struct mtk_mdp_pix_align mtk_mdp_size_align = {
 	.org_w			= 16,
-	.org_h			= 16,
+	.org_h			= 32,
 	.target_w		= 2,
 	.target_h		= 2,
 };

-- 
2.56.1


