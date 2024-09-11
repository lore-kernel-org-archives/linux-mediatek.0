Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97BB0EE4998
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 12:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LreFkTuW7liUdQSgQl8JsUo6bkRPZ76VmfyP6CVpOVQ=; b=fsLqIWOc4PrzMt77YxCeBb0g/h
	Fs0UfuJ93V4IJ9CbbF8o7K1C3r7U3Sogl76kVxSrDrba5mjKYt7VFgXNaumcGmuL19JHCHJFXJAY3
	o8iQl7UR3xfcXjufo5E2dDCljC/R2paV3ChUrfRTMLeBfeICBWRUTB6V+Nw4/7oJ6gFLbElQ6cTQB
	CQO36v5g5H1u2Yy4cCO3e7dEhOBlMZQaDm1hqNL+uhvdfoLhIA7W2tjeO0eEgs8VZnxwCF8NorC0J
	N+DIycmrgpLs9B+nOtXA1C7jkPGjTGGHU5Uu5d2487zu6TtnN000IOZrjSzUiuk6z2z+9dEeSIzC0
	Rvmcsx2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soM5K-00000009Otq-1YPt;
	Wed, 11 Sep 2024 12:04:34 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soM3u-00000009OUM-3vMY
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Sep 2024 12:03:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=LreFkTuW7liUdQSgQl8JsUo6bkRPZ76VmfyP6CVpOVQ=;
	b=BzUB+j4Vd55Bon2kvkuyeDzgyMsy6J424AkxqX+QcdeMCP0OY1mg9w4TkrEzJ8
	BeHbCm1vV/54NOrMrUsHLVJvsWZIbr2LELQFsn//VeUMht/h6TsNMDQ7Rd69HhBF
	/B1FEE5s/vctB8RhAwG42FzXvaeAQBrLQpQrn8pGvG5ZE=
Received: from localhost (unknown [120.26.85.94])
	by gzga-smtp-mta-g3-4 (Coremail) with SMTP id _____wBnSp_ehuFmOiukDQ--.6702S2;
	Wed, 11 Sep 2024 20:02:38 +0800 (CST)
Date: Wed, 11 Sep 2024 20:02:38 +0800
From: Qianqiang Liu <qianqiang.liu@163.com>
To: Mark Brown <broonie@kernel.org>
Cc: amergnat@baylibre.com, angelogioacchino.delregno@collabora.com,
	lgirdwood@gmail.com, matthias.bgg@gmail.com,
	linux-sound@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: mt8365: Fix using uninitialized value "i2s_data"
 issue
Message-ID: <ZuGG3jk6oqq7sUMw@iZbp1asjb3cy8ks0srf007Z>
References: <20240911001516.47268-1-qianqiang.liu@163.com>
 <9ea8731a-7888-40a2-a183-4598884bbb27@sirena.org.uk>
 <ZuGAwQGPWdpO1-G9@iZbp1asjb3cy8ks0srf007Z>
 <eb21bcab-333d-4ab3-9222-058764ced720@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb21bcab-333d-4ab3-9222-058764ced720@sirena.org.uk>
X-CM-TRANSID: _____wBnSp_ehuFmOiukDQ--.6702S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uF1rJFykGry7Jr15Cw4Uurg_yoW8XrWDp3
	4ktan2kFyqqr4jyrsrur1UtasIk3y3JFZrWay7Jw12yFy3ur4a9Fn2kas0kFWvqrnaywnF
	qrW2qr9xJrZ5A3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jcdbbUUUUU=
X-Originating-IP: [120.26.85.94]
X-CM-SenderInfo: xtld01pldqwhxolxqiywtou0bp/1tbiRQJXamXAo2LUZAACss
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_050307_624467_8F729FAF 
X-CRM114-Status: GOOD (  15.29  )
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

On Wed, Sep 11, 2024 at 12:41:15PM +0100, Mark Brown wrote:
> On Wed, Sep 11, 2024 at 07:36:33PM +0800, Qianqiang Liu wrote:
> > On Wed, Sep 11, 2024 at 11:52:58AM +0100, Mark Brown wrote:
> > > On Wed, Sep 11, 2024 at 08:15:17AM +0800, Qianqiang Liu wrote:
> 
> > > >  	spin_lock_irqsave(&afe_priv->afe_ctrl_lock, flags);
> 
> > > > +	if (!i2s_data) {
> > > > +		spin_unlock_irqrestore(&afe_priv->afe_ctrl_lock, flags);
> > > > +		return;
> > > > +	}
> 
> > > Why would we look up i2s_data without the lock, take the lock, then
> > > check if we actually found it?  That doesn't seem right.
> 
> > Just check the "i2s_data" is NULL or not.
> 
> That doesn't address my question at all.

How about this new patch:

diff --git a/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c b/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
index 3482d8f8b4e7..11b9a5bc7163 100644
--- a/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
+++ b/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
@@ -465,13 +465,16 @@ void mt8365_afe_set_i2s_out_enable(struct mtk_base_afe *afe, bool enable)
 	int i;
 	unsigned long flags;
 	struct mt8365_afe_private *afe_priv = afe->platform_priv;
-	struct mtk_afe_i2s_priv *i2s_data;
+	struct mtk_afe_i2s_priv *i2s_data = NULL;
 
 	for (i = 0; i < DAI_I2S_NUM; i++) {
 		if (mt8365_i2s_priv[i].adda_link)
 			i2s_data = afe_priv->dai_priv[mt8365_i2s_priv[i].id];
 	}
 
+	if (!i2s_data)
+		return;
+
 	spin_lock_irqsave(&afe_priv->afe_ctrl_lock, flags);
 
 	if (enable) {

-- 
Best,
Qianqiang Liu


