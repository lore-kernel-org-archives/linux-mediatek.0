Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D70BBC6FA99
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Mar 2023 09:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2PsOAzVqf05NGT4ISlB3zQ90ePYfBtUiywnLfEvTUnY=; b=utHisGM36fxkY94qWlx89H6U99
	ega/HJ9Si0DJcTkgag6Xd5OL2siR5vaxHY2imJV0b1Mn069VYas6q25ZJ+p70h4DVeR2pJ54uYAFj
	zm/DTnPtBTpgBkkOf22f9UV0z6YiFzq3Q/DSn0ZM/EnK0wk7wiY9LbxzzaYNbDy6PWxhbf6GIF4Hl
	2pIS7bzw4LV3wr2ixXqsqqsht+no34ZFFIdaS2/vPR7C5boaa8Mji71HnPDe9UQ/gq0KyNUM2Wq+S
	rCIcFSbFUQb/mB13IQ5mP5Sap9YxkeKRjG+B5NZ9ctjGzzHLu03WRfOD/W+LAMQ7CwvejifhLzv/T
	fdRg4T4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbIDn-0022di-86; Sun, 12 Mar 2023 09:42:31 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbIDc-0022cM-Nz; Sun, 12 Mar 2023 09:42:22 +0000
Received: from pendragon.ideasonboard.com (85-76-49-20-nat.elisa-mobile.fi [85.76.49.20])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E5D30814;
	Sun, 12 Mar 2023 10:42:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1678614135;
	bh=2ZEVl5rsK5H4zvdfeUpUGY8WalO/tOcjHbf6ZixUYTY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uW96zgPhEyFUlg4cwx9U8aHK5ydpIh7K+GzgaU9BL/vhdw/+zL9BwsVRIklgwy83n
	 znnzlWCsVkBmtHm+lRiw3bEhYFZhWAax0IaEGUVALEnD+uuJxSGkkm7T2ZqG7LsoeF
	 i/JJlR0QZobdvA1oeaCuik3cfnIoI/l0HyEqwgro=
Date: Sun, 12 Mar 2023 11:42:16 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tony Lindgren <tony@atomide.com>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/9] regulator: max20086: Mark OF related data as maybe
 unused
Message-ID: <20230312094216.GC707@pendragon.ideasonboard.com>
References: <20230310214553.275450-1-krzysztof.kozlowski@linaro.org>
 <20230310214553.275450-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230310214553.275450-2-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_014220_967828_21C28D77 
X-CRM114-Status: GOOD (  19.75  )
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

Hi Krzysztof,

Thank you for the patch.

On Fri, Mar 10, 2023 at 10:45:46PM +0100, Krzysztof Kozlowski wrote:
> The driver can be compile tested with !CONFIG_OF making certain data
> unused:
> 
>   drivers/regulator/max20086-regulator.c:289:34: error: ‘max20086_dt_ids’ defined but not used [-Werror=unused-const-variable=]
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/regulator/max20086-regulator.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/regulator/max20086-regulator.c b/drivers/regulator/max20086-regulator.c
> index b8bf76c170fe..c98a72f43935 100644
> --- a/drivers/regulator/max20086-regulator.c
> +++ b/drivers/regulator/max20086-regulator.c
> @@ -286,7 +286,7 @@ static const struct i2c_device_id max20086_i2c_id[] = {
>  
>  MODULE_DEVICE_TABLE(i2c, max20086_i2c_id);
>  
> -static const struct of_device_id max20086_dt_ids[] = {
> +static const struct of_device_id max20086_dt_ids[] __maybe_unused = {

The following change would also work, as the of_match_table field of
struct device_driver isn't conditioned by CONFIG_OF:

diff --git a/drivers/regulator/max20086-regulator.c b/drivers/regulator/max20086-regulator.c
index b8bf76c170fe..ad92f84b4abb 100644
--- a/drivers/regulator/max20086-regulator.c
+++ b/drivers/regulator/max20086-regulator.c
@@ -320,7 +320,7 @@ MODULE_DEVICE_TABLE(of, max20086_dt_ids);
 static struct i2c_driver max20086_regulator_driver = {
 	.driver = {
 		.name = "max20086",
-		.of_match_table = of_match_ptr(max20086_dt_ids),
+		.of_match_table = max20086_dt_ids,
 	},
 	.probe_new = max20086_i2c_probe,
 	.id_table = max20086_i2c_id,

Your patch should reduce the module size without any real drawback as
far as I can see, so that's probably best. I'm fine with either
approach, so

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	{
>  		.compatible = "maxim,max20086",
>  		.data = &(const struct max20086_chip_info) {

-- 
Regards,

Laurent Pinchart

